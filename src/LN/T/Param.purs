module LN.T.Param (
  sortOrderFromString,
  orderFromString
) where



import LN.T.Internal.Types



sortOrderFromString :: String -> SortOrderBy
sortOrderFromString s =
  case s of
    "asc"  -> SortOrderBy_Asc
    "dsc"  -> SortOrderBy_Dsc
    "rand" -> SortOrderBy_Rnd
    _      -> SortOrderBy_None



orderFromString :: String -> OrderBy
orderFromString s =
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
