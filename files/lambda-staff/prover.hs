{-
 - A Tiny proof assistant for propositional logic
 - @ljt12138 
 -}

import qualified Data.Map as Map
import qualified Data.Set as Set

-- Firstly we define the type and lambda term
  -- type := V | type -> type | ⊥
  -- term := V | (term term) | λu:T.term | μu:~T.term
-- Note that here (Mu u t e) refers to "μu:¬t.e"

data Type = TypeId Int | TypeArrow Type Type | Perp
data Term = VarId Int | App Term Term | Abs Int Type Term | Mu Int Type Term
type Context = Map.Map Int Type

-- The arrow type (TypeArrow p q) is denoted as (p --> q)
-- "¬p" is denoted as "p -> ⊥" 

infixr 5 -->
(-->) u v = TypeArrow u v

lnot u = u --> Perp
atom u = TypeId u
perp = Perp

infixl 6 \/
(\/) u v = (lnot u)-->v
infixl 7 /\
(/\) u v = (u-->(lnot v))-->perp
infixl 4 <->
(<->) u v = (u --> v) /\ (v --> u)

-- Print functions for type and lambda term

instance (Show Type) where 
  show (TypeId u) = "t" ++ show u
  show (TypeArrow u Perp) = "¬" ++ show u
  show (TypeArrow u v) = "(" ++ show u ++ "→" ++ show v ++ ")"
  show Perp = "⊥"

show_sugared (TypeId u) = "t" ++ show u
show_sugared (TypeArrow (TypeArrow u Perp) v) = "(" ++ show_sugared u ++ "∨" ++ show_sugared v ++ ")"
show_sugared (TypeArrow (TypeArrow u (TypeArrow v Perp)) Perp) = "(" ++ show_sugared u ++ "∧" ++ show_sugared v ++ ")"
show_sugared (TypeArrow u Perp) = "¬" ++ show_sugared u
show_sugared (TypeArrow u v) = "(" ++ show_sugared u ++ "→" ++ show_sugared v ++ ")"
show_sugared Perp = "⊥"

instance (Show Term) where
  show (VarId u) = "v" ++ show u
  show (App e e') = "(" ++ show e ++ " " ++ show e' ++ ")"
  show (Abs id t e) = "λv" ++ show id ++ ":" ++ show t ++ "." ++ show e
  show (Mu id t e) = "μv" ++ show id ++ ":" ++ show t ++ "." ++ show e 

-- We use this to check whether two functions are equivalent

sametype (TypeId u) (TypeId v) = u == v
sametype (TypeArrow u u') (TypeArrow v v') = (sametype u v) && (sametype u' v')
sametype Perp Perp = True
sametype _ _ = False

-- Typing rules for lambda term
-- If a term is not well-typed, return Nothing

get_type :: Context -> Term -> Maybe Type
get_type con (VarId id)   = Map.lookup id con
get_type con (Abs id t e) = fmap (\x -> t --> x) $ get_type (Map.insert id t con) e 
get_type con (Mu id t e) = case get_type (Map.insert id (lnot t) con) e of
                             Just Perp -> Just t
                             _ -> Nothing                             
get_type con (App e e') = let tt  = get_type con e
                              tt' = get_type con e'
  in case tt' of
       Just t' -> case tt of 
                     Just (TypeArrow t1 t2) ->
                       if sametype t1 t' then
                         Just t2
                       else
                         Nothing
                     _ -> Nothing
       _ -> Nothing

well_typed c = case get_type Map.empty c of
                 Nothing -> False
                 Just _  -> True
typeof term = case get_type Map.empty term of
                Just t -> t
                Nothing -> error "untypable term"

-- The free variable of a lambda term

get_free (VarId id) = Set.singleton id
get_free (Abs id t e) = Set.delete id (get_free e)
get_free (App e e') = Set.union (get_free e) (get_free e')

-- Definition of combinator term
  -- cterm := V | (cterm cterm) | S_{p,q,r} | K_{p,q} | D_{p}
  -- S : (p->q->r)->(p->q)->p->r
  -- K : p->q->p
  -- D : ¬¬p->p
  
data CTerm = CVarId Int | CApp CTerm CTerm | S Type Type Type | K Type Type | D Type 

instance (Show CTerm) where
  show (CVarId id) = "v" ++ show id
  show (CApp c c') = "(" ++ show c ++ " " ++ show c' ++ ")"
  show (S p q r) = "S_{" ++ show p ++ "," ++ show q ++ "," ++ show r ++ "}"
  show (K p q) = "K_{" ++ show p ++ "," ++ show q ++ "}"
  show (D p) = "D_{" ++ show p ++ "}"

-- Typing rules for combinator term
  -- Note that (CApp c c') corresponds to the Modus Ponens rule
  
get_type_c con (CVarId id) = Map.lookup id con
get_type_c con (S p q r) = Just $ (p --> q --> r) --> (p --> q) --> p --> r
get_type_c con (K p q) = Just $ p --> q --> p
get_type_c con (D p) = Just $ (lnot $ lnot p) --> p
get_type_c con (CApp c c') = let tt  = get_type_c con c
                                 tt' = get_type_c con c'
  in case tt' of
       Just t' -> case tt of 
                     Just (TypeArrow t1 t2) ->
                       if sametype t1 t' then
                         Just t2
                       else
                         Nothing
                     _ -> Nothing
       _ -> Nothing

well_typed_c c = case get_type_c Map.empty c of
                   Nothing -> False
                   Just _  -> True
                   
typeof_c c = case get_type_c Map.empty c of
               Just t -> t
               Nothing -> error "untypable cterm"

-- The free variable of a combinator term
  -- Note that a term is called closed, if there is no free variables
  -- A closed term (c : T) corresponds to a proof "|- T"
  -- A term (c : T) corresponds to a proof "type of free variables of c |- T" 

get_free_c (CVarId id) = Set.singleton id
get_free_c (CApp c c') = Set.union (get_free_c c) (get_free_c c')
get_free_c _ = Set.empty

-- Combinator Term I = S K K

id_cterm p = CApp (CApp (S p (p-->p) p) (K p (p-->p))) (K p p)
  
-- λ*x:T.A, where A is a combinator term
  -- such that ((λ*x:T.A) B) -> A[x |-> B]
  
lambda_star con x t (CVarId u) = if x == u then
                                   id_cterm t
                                 else case Map.lookup u con of
                                        Nothing -> error $ "variable t" ++ show u ++ " not found"
                                        Just t' -> CApp (K t' t) (CVarId u)
lambda_star con x t (cterm@(CApp a b)) = let (Just (TypeArrow p q)) = get_type_c (Map.insert x t con) a
                                             a' = lambda_star con x t a
                                             b' = lambda_star con x t b
                                         in if Set.member x (get_free_c cterm) then
                                              (CApp (CApp (S t p q) a') b')
                                            else CApp (K q t) cterm  
lambda_star con x t single = let p = typeof_c single in
                               CApp (K p t) single
                               
-- Translater from λ term to combinator term

-- data Term = VarId Int | App Term Term | Abs Int Type Term | Mu Int Type Term

translate_l2c con (VarId id)  = CVarId id
translate_l2c con (App e e')  = CApp (translate_l2c con e) (translate_l2c con e')
translate_l2c con (Abs x t e) = let c = translate_l2c (Map.insert x t con) e in
                                  lambda_star con x t c
translate_l2c con (Mu x t e)  = let c = translate_l2c (Map.insert x (t-->perp) con) e in
                                  CApp (D t) (lambda_star con x (t-->perp) c)

{-
 Example 1 : (~p->~q)->q->p
 
   let p = TypeId 1
   let q = TypeId 2
   let r = TypeId 3 
   let pf = (Abs 1 ((p-->perp)-->(q-->perp)) (Abs 2 q (Mu 3 p (App (App (VarId 1) (VarId 3)) (VarId 2)))))
   let c = translate_l2c Map.empty pf
   typeof pf
   typeof_c c
-}

-- Show the term and cterm in a la Curry
  -- or print a "proof skeleton"

skeleton (VarId u)    = "v" ++ show u
skeleton (App e e')   = "(" ++ skeleton e ++ " " ++ skeleton e' ++ ")"
skeleton (Abs x t e)  = "λv" ++ show x ++ "." ++ skeleton e
skeleton (Mu x t e)   = "μv" ++ show x ++ "." ++ skeleton e 

skeleton_c (CVarId u)  = "v" ++ show u
skeleton_c (CApp c c') = "(" ++ skeleton_c c ++ " " ++ skeleton_c c' ++ ")"
skeleton_c (S _ _ _)   = "S"
skeleton_c (K _ _)     = "K"
skeleton_c (D _)       = "D"

-- Generate a "human readable" proof
  -- In Hilbert-Style system, with a combinator term

generate_c (CVarId u) id  = error "unfinished proof"
generate_c (CApp c c') id = let (p1, tp1) = generate_c c id
                                l1 = length p1
                                (p2, tp2) = generate_c c' (id+l1)
                                l2 = length p2
                                (TypeArrow p q) = tp1
                            in (p1 ++ p2 ++ [("MP " ++ show (id+l1) ++ "," ++ show (id+l1+l2), q)], q)
generate_c s@(S _ _ _) id = let tp = typeof_c s in
                           ([("Axiom 1", tp)], tp)
generate_c k@(K _ _)   id = let tp = typeof_c k in
                           ([("Axiom 2", tp)], tp)
generate_c d@(D _)     id = let tp = typeof_c d in
                           ([("Axiom 3", tp)], tp)

show_proof [] id = ""
show_proof ((hint, tp):xs) id = show (id+1) ++ ". " ++ hint ++ "\t|- " ++ show tp ++ "\n" ++ show_proof xs (id+1)

show_theorem (pf, thm) = "Theorem : " ++ show_sugared thm ++ ".\n"
                         ++ "Proof.\n"
                         ++ show_proof pf 0
                         ++ "Qed."

-- Example 2 : Try `putStrLn $ show_theorem $ generate_c c 0` for Example 1

{-
 Example 3 : (p->q) -> (q->r) -> (p->r)

   let p = TypeId 1
   let q = TypeId 2
   let r = TypeId 3 
   let pf = (Abs 1 (p-->q) (Abs 2 (q-->r) (Abs 3 p (App (VarId 2) (App (VarId 1) (VarId 3))))))
   let c = translate_l2c Map.empty pf
   typeof pf
   typeof_c c
   putStrLn $ show_theorem $ generate_c c 0
-}

-- Proof Assistant

data Command = Intro Int | Apply Int | Contra Int | JustA Int | PerpIn Int |
               Identity | Assumption |
               SyntaxError 
{-
 - Supported Commands:
 1. intro u :: Suppose current goal is (p->q), this command will introduce
               a new assumption (u : p), and change the goal into q.
 2. apply u :: Suppose r is current goal and (u : p->q) is an assumption,
               this command will firstly produce a subgoal p. After it is
               proved, it will change the goal into q->r.
 3. contra u :: Suppose current goal is r, this command will introduce a
                new assumption (u : ¬r), and change the goal into ⊥. 
 4. just u :: Finish the proof if current goal is just the assumption with
              id u.
 5. PerpIn u :: Finish the proof (u : ⊥) is an assumption.
 6. Identity :: Finish the proof if current goal is (p->p) for some p.
 7. Assumption :: Finish the proof if current goal is an assumption.
-}

parse_cmd_2 "intro" id = Intro (read id)
parse_cmd_2 "apply" id = Apply (read id)
parse_cmd_2 "contra" id = Contra (read id)
parse_cmd_2 "just" id = JustA (read id)
parse_cmd_2 "perp" id = PerpIn (read id)
parse_cmd_2 _ _ = SyntaxError

parse_cmd_1 "identity" = Identity
parse_cmd_1 "assumption" = Assumption
parse_cmd_1 _ = SyntaxError

print_assumption con =
  let lst = Map.toList con in
    foldr (\(id, tp) str -> show id ++ "\t:\t" ++ show tp ++ "\n" ++ str) "------------" lst
                           
prove :: Type -> Context -> Int -> IO Term
prove tp con level =
  do putStrLn $ print_assumption con
     let lead = ((if level == 0 then "goal" else ("subgoal" ++ show level)) ++ ":\t") in
       putStrLn $ lead ++ show tp 
     putStr "> "
     cmdlist <- words `fmap` getLine
     let cmd = case cmdlist of
                 [a,b] -> parse_cmd_2 a b
                 [a] -> parse_cmd_1 a 
                 _ -> SyntaxError
       in case cmd of
            Intro u -> case tp of
                         TypeArrow p q ->
                           do res <- prove q (Map.insert u p con) level
                              return (Abs u p res)
                         _ -> do putStrLn "ERROR: there is nothing to introduce"
                                 prove tp con level
            Apply u -> case Map.lookup u con of
                         Just (TypeArrow p q) ->                     -- u    : p --> q
                           do res <- prove p con (level+1)           -- res  : p 
                              res' <- prove (q-->tp) con level       -- res' : q --> t
                              return (App res' (App (VarId u) res))
                         Nothing -> do putStrLn "ERROR: no such assumption"
                                       prove tp con level
                         _ -> do putStrLn "ERROR: not valid assumption"
                                 prove tp con level
            Contra u -> do res <- prove perp (Map.insert u (tp-->perp) con) level
                           return (Mu u tp res)
            JustA u -> case Map.lookup u con of
                         Just tp' -> if sametype tp' tp then
                                       return (VarId u)
                                     else do putStrLn "ERROR: incorrect assumption"
                                             prove tp con level
                         Nothing -> do putStrLn "ERROR: no such assumption"
                                       prove tp con level
            Identity -> case tp of
                          TypeArrow p q -> if sametype p q then
                                             return (Abs 1 p (VarId 1))
                                           else do putStrLn "ERROR: not an identity"
                                                   prove tp con level
                          _ -> do putStrLn "ERROR: not an identity"
                                  prove tp con level
            PerpIn u -> case Map.lookup u con of
                          Just Perp -> return (Mu 1 tp (VarId u))
                          Just _ -> do putStrLn "ERROR: not a ⊥"
                                       prove tp con level
                          Nothing -> do putStrLn "ERROR: no such assumption"
                                        prove tp con level
            Assumption -> let con' = Map.filter (\x -> sametype x tp) con in
                            if Map.null con' then
                              do putStrLn "ERROR: no such assumption"
                                 prove tp con level
                            else return $ VarId $ fst (Map.findMin con')
            SyntaxError -> do putStrLn "ERROR: syntax error"
                              prove tp con level

-- State a theorem, prove it and generate a human-readable proof
--  in Hilbert Style System

theorem thm = do pf <- prove thm Map.empty 0
                 let c = translate_l2c Map.empty pf in
                   putStrLn $ show_theorem $ generate_c c 0
              
