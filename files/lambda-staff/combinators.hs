import qualified Data.Set as Set
import qualified Data.Char as Char

data Lambda = LVar Int | LApp Lambda Lambda | LAbs Int Lambda
data Combinator = S | K | I | CApp Combinator Combinator |
                  CVar Int

freeVarC S            = Set.empty
freeVarC K            = Set.empty
freeVarC I            = Set.empty
freeVarC (CApp c1 c2) = Set.union (freeVarC c1) (freeVarC c2)
freeVarC (CVar x)     = Set.singleton x

simpl x c@(CVar y)     = if x == y then I else (CApp K c)
simpl x c@(CApp c1 c2) = let fv = freeVarC c in
                           if Set.notMember x fv then
                             CApp K c
                           else CApp (CApp S (simpl x c1)) (simpl x c2)       
simpl x c = CApp K c

translate (LVar x)     = CVar x
translate (LApp e1 e2) = CApp (translate e1) (translate e2)
translate (LAbs x e)   = simpl x (translate e)

instance Show Lambda where
  show (LVar x) = "v{" ++ show x ++ "}"
  show (LApp e1 e2) = "(" ++ show e1 ++ " " ++ show e2 ++ ")"
  show (LAbs x e) = "\\" ++ show (LVar x) ++ "." ++ show e
  
instance Show Combinator where
  show S = "S"
  show K = "K"
  show I = "I"
  show (CApp c1 c2) = "(" ++ show c1 ++ " " ++ show c2 ++ ")"
  show (CVar x) = "v{" ++ show x ++ "}" 

reduceW (CApp I f)          = Just f
reduceW (CApp (CApp K f) g) = Just f
reduceW (CApp (CApp (CApp S f) g) h) = Just (CApp (CApp f h) (CApp g h))
reduceW (CApp f g) = let mf' = reduceW f
                         mg' = reduceW g in
                       case mf' of
                         Nothing -> case mg' of
                                      Nothing -> Nothing
                                      Just g' -> Just (CApp f g')
                         Just f' -> Just (CApp f' g)
reduceW _ = Nothing

normalize u = case reduceW u of
                Nothing -> u
                Just u' -> normalize u'

initC = reverse . (filter (\x -> x == '(' || x == ')'
                            || x == '{' || x == '}'
                            || Char.isAlphaNum x))

parseInt ('{':s) = (Just 0, s)
parseInt (x:s) = if Char.isDigit x then
                   case parseInt s of
                     (Nothing, s') -> (Nothing, s')
                     (Just n, s') -> (Just (n*10+xv), s')
                       where xv = Char.digitToInt x
                 else
                   (Nothing, s)
  
parseC ('S':s) = case parseC s of
                   (Nothing, s') -> (Just S, s')
                   (Just e, s') -> (Just (CApp e S), s')
parseC ('K':s) = case parseC s of
                   (Nothing, s') -> (Just K, s')
                   (Just e, s') -> (Just (CApp e K), s')
parseC ('I':s) = case parseC s of
                   (Nothing, s') -> (Just I, s')
                   (Just e, s') -> (Just (CApp e I), s')
parseC ('}':s) = let (u, s') = parseInt s in
                   case u of
                     Nothing -> (Nothing, s)
                     Just x  -> case parseC s' of
                                  (Nothing, s'') -> (Just (CVar x), s'')
                                  (Just e, s'')  -> (Just (CApp e (CVar x)), s'')
parseC (')':s) = let (mr, s') = parseC s in
                   case mr of
                     Nothing -> (Nothing, s')
                     Just e  -> let (mnxt, snxt) = parseC s' in
                       case mnxt of
                         Nothing -> (Nothing, snxt)
                         Just e' -> (Just (CApp e' e), snxt)
parseC ('(':s) = (Nothing, s)
parseC "" = (Nothing, "")
parseC s@(_:s') = (Nothing, s)

main = do putStr "Input SKI: "
          str <- getLine
          (res, s) <- return $ parseC $ initC str
          output <- case res of
                      Nothing -> return $ "Parse Error. Hint: \'" ++
                                 (reverse $ tail s) ++
                                 "[" ++ [head s] ++ "]\'"
                      Just e  -> return $ show $ normalize e
          putStrLn output
          
