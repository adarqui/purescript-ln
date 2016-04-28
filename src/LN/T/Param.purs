module LN.T.Param where



import LN.T.Internal.Types



orderFromString :: String -> Param
orderFromString s =
  case s of
    "asc"  -> OrderAsc
    "dsc"  -> OrderDsc
    "rand" -> OrderRand
    _      -> OrderAsc



orderByFromString :: String -> OrderBy
orderByFromString s =
  case s of
    "user_id"     -> OrderBy_UserId
    "created_at"  -> OrderBy_CreatedAt
    "modified_at" -> OrderBy_ModifiedAt
    "modified_by" -> OrderBy_ModifiedBy
    "activity_at" -> OrderBy_ActivityAt
    "org_id"      -> OrderBy_OrganizationId
    "team_id"     -> OrderBy_TeamId
    "forum_id"    -> OrderBy_ForumId
    "board_id"    -> OrderBy_BoardId
    "thread_id"   -> OrderBy_ThreadId
    "id"          -> OrderBy_Id
    _             -> OrderBy_None
