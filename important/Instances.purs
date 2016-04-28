


instance paramQueryParam :: QueryParam Param where
  qp (Limit limit)                       = Tuple "limit" (show limit)
  qp (Offset offset)                     = Tuple "offset" (show offset)
  qp OrderAsc                            = Tuple "order" ("asc")
  qp OrderDsc                            = Tuple "order" ("dsc")
  qp OrderRand                           = Tuple "order" ("rand")
  qp (OrderBy order)                     = Tuple "order_by" (show order)
  qp (ByOrganizationId org_id)           = Tuple "organization_id" (show org_id)
  qp (ByOrganizationsIds orgs_ids)       = Tuple "organizations_ids" (show orgs_ids)
  qp (ByOrganizationName org_name)       = Tuple "organization_name" org_name
  qp (ByUserId user_id)                  = Tuple "user_id" (show user_id)
  qp (ByUsersIds users_ids)              = Tuple "users_ids" (show users_ids)
  qp (ByUserNick nick)                   = Tuple "user_nick" (show nick)
  qp (ByUsersNicks nicks)                = Tuple "users_nicks" (show nicks)
  qp (ByForumId forum_id)                = Tuple "forum_id" (show forum_id)
  qp (ByForumsIds forums_ids)            = Tuple "forums_ids" (show forums_ids)
  qp (ByBoardId board_id)                = Tuple "board_id" (show board_id)
  qp (ByBoardsIds boards_ids)            = Tuple "boards_ids" (show boards_ids)
  qp (ByThreadId thread_id)              = Tuple "thread_id" (show thread_id)
  qp (ByThreadsIds threads_ids)          = Tuple "threads_ids" (show threads_ids)
  qp (ByThreadPostId thread_post_id)     = Tuple "thread_post_id" (show thread_post_id)
  qp (ByThreadPostsIds thread_posts_ids) = Tuple "thread_posts_ids" (show thread_posts_ids)

instance orderByShow :: Show OrderBy where
  show OrderBy_UserId     = "user_id"
  show OrderBy_CreatedAt  = "created_at"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_ActivityAt = "activity_at"
  show OrderBy_OrganizationId = "org_id"
  show OrderBy_TeamId     = "team_id"
  show OrderBy_ForumId    = "forum_id"
  show OrderBy_BoardId    = "board_id"
  show OrderBy_ThreadId   = "thread_id"
  show OrderBy_Id         = "id"
  show OrderBy_None       = "none"
