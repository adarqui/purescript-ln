


instance paramQueryParam :: QueryParam Param where
  qp (Limit limit)                       = Tuple "limit" (show limit)
  qp (Offset offset)                     = Tuple "offset" (show offset)
  qp (SortOrder sort_order_by)           = Tuple "sort_order" (show sort_order_by)
  qp (Order order_by)                    = Tuple "order_by" (show order_by)
  qp (ByOrganizationId org_id)           = Tuple "organization_id" (show org_id)
  qp (ByOrganizationsIds orgs_ids)       = Tuple "organizations_ids" (show orgs_ids)
  qp (ByOrganizationName org_name)       = Tuple "organization_name" (org_name)
  qp (ByTeamId team_id)                  = Tuple "team_id" (show team_id)
  qp (ByTeamsIds teams_ids)              = Tuple "teams_ids" (show teams_ids)
  qp (ByTeamName team_name)              = Tuple "team_name" (team_name)
  qp (ByTeamMemberId team_member_id)     = Tuple "team_id" (show team_member_id)
  qp (ByTeamMembersIds team_members_ids) = Tuple "teams_ids" (show teams_members_ids)
  qp (ByUserId user_id)                  = Tuple "user_id" (show user_id)
  qp (ByUsersIds users_ids)              = Tuple "users_ids" (show users_ids)
  qp (ByUserNick nick)                   = Tuple "user_nick" (show nick)
  qp (ByUsersNicks nicks)                = Tuple "users_nicks" (show nicks)
  qp (ByGlobalGroupId group_id)          = Tuple "group_id" (show group_id)
  qp (ByGlobalGroupsIds groups_ids)      = Tuple "groups_ids" (show groups_ids)
  qp (ByGroupId group_id)                = Tuple "group_id" (show group_id)
  qp (ByGroupsIds groups_ids)            = Tuple "groups_ids" (show groups_ids)
  qp (ByGroupMemberId group_member_id)   = Tuple "group_id" (show group_member_id)
  qp (ByGroupMembersIds group_members_ids) = Tuple "groups_ids" (show groups_members_ids)
  qp (ByForumId forum_id)                = Tuple "forum_id" (show forum_id)
  qp (ByForumsIds forums_ids)            = Tuple "forums_ids" (show forums_ids)
  qp (ByForumName forum_name)            = Tuple "forum_name" (forum_name)
  qp (ByBoardId board_id)                = Tuple "board_id" (show board_id)
  qp (ByBoardsIds boards_ids)            = Tuple "boards_ids" (show boards_ids)
  qp (ByBoardName board_name)            = Tuple "board_name" (board_name)
  qp (ByThreadId thread_id)              = Tuple "thread_id" (show thread_id)
  qp (ByThreadsIds threads_ids)          = Tuple "threads_ids" (show threads_ids)
  qp (ByThreadName thread_name)          = Tuple "thread_name" (thread_name)
  qp (ByThreadPostId thread_post_id)     = Tuple "thread_post_id" (show thread_post_id)
  qp (ByThreadPostsIds thread_posts_ids) = Tuple "thread_posts_ids" (show thread_posts_ids)
  qp (ByThreadPostName thread_post_name) = Tuple "thread_post_name" (thread_post_name)
  qp (ByThreadPostLikeId like_id)        = Tuple "thread_post_like_id" (show like_id)
  qp (ByThreadPostLikesIds likes_ids)    = Tuple "thread_post_likes_ids" (show likes_ids)
  qp (ByThreadPostStarId star_id)        = Tuple "thread_post_star_id" (show star_id)
  qp (ByThreadPostStarsIds stars_ids)    = Tuple "thread_post_stars_ids" (show stars_ids)
  qp (ByBucketId bucket_id)              = Tuple "bucket_id" (show bucket_id)
  qp (ByResourceId resource_id)          = Tuple "resource_id" (show resource_id)
  qp (ByResourcesIds resources_ids)      = Tuple "resources_ids" (show resources_ids)
  qp (ByResourceName resource_name)      = Tuple "resource_name" (resource_name)
  qp (ByLeuronId leuron_id)              = Tuple "leuron_id" (show leuron_id)
  qp (ByLeuronsIds leurons_ids)          = Tuple "leurons_ids" (show leurons_ids)
  qp (ByPmId pm_id)                      = Tuple "pm_id" (show pm_id)
  qp (ByPmsIds pms_ids)                  = Tuple "pms_ids" (show pms_ids)
  qp (ByReminderId reminder_id)          = Tuple "reminder_id" (show reminder_id)
  qp (ByReminderFolderId reminder_folder)= Tuple "reminder_folder_id" (show reminder_folder)
  qp (ByParentId parent_id)              = Tuple "parent_id" (show parent_id)
  qp (ByParentsIds parents_ids)          = Tuple "parents_ids" (show parents_ids)
  qp (ByParentName parent_name)          = Tuple "parent_name" (parent_name)
  qp (Timestamp ts)                      = Tuple "ts" (show ts)
  qp (UnixTimestamp unix_ts)             = Tuple "unix_ts" (show unix_ts)
  qp (CreatedAtTimestamp created_at)     = Tuple "created_at_ts" (show created_at)
  qp (CreatedAtUnixTimestamp created_at) = Tuple "created_at_unix_ts" (show created_at)
  qp (RealIP real_ip)                    = Tuple "real_ip" (real_ip)
  qp (IP ip)                             = Tuple "ip" (ip)



instance paramTagShow :: Show ParamTag where
  show ParamTag_Limit                  = "limit"
  show ParamTag_Offset                 = "offset"
  show ParamTag_SortOrder              = "sort_order"
  show ParamTag_Order                  = "order"
  show ParamTag_ByOrganizationId       = "organization_id"
  show ParamTag_ByOrganizationsIds     = "organizations_ids"
  show ParamTag_ByOrganizationName     = "organization_name"
  show ParamTag_ByTeamId               = "team_id"
  show ParamTag_ByTeamsIds             = "teams_ids"
  show ParamTag_ByTeamName             = "team_name"
  show ParamTag_ByTeamMemberId         = "team_member_id"
  show ParamTag_ByTeamMembersIds       = "teams_member_ids"
  show ParamTag_ByUserId               = "user_id"
  show ParamTag_ByUsersIds             = "users_ids"
  show ParamTag_ByUserNick             = "user_nick"
  show ParamTag_ByUsersNicks           = "users_nicks"
  show ParamTag_ByGlobalGroupId        = "global_group_id"
  show ParamTag_ByGlobalGroupsIds      = "global_groups_ids"
  show ParamTag_ByGroupId              = "group_id"
  show ParamTag_ByGroupsIds            = "groups_ids"
  show ParamTag_ByGroupMemberId        = "group_member_id"
  show ParamTag_ByGroupMembersIds      = "groups_member_ids"
  show ParamTag_ByForumId              = "forum_id"
  show ParamTag_ByForumsIds            = "forums_ids"
  show ParamTag_ByForumName            = "forum_name"
  show ParamTag_ByBoardId              = "board_id"
  show ParamTag_ByBoardsIds            = "boards_ids"
  show ParamTag_ByBoardName            = "board_name"
  show ParamTag_ByThreadId             = "thread_id"
  show ParamTag_ByThreadsIds           = "threads_ids"
  show ParamTag_ByThreadName           = "thread_name"
  show ParamTag_ByThreadPostId         = "thread_post_id"
  show ParamTag_ByThreadPostsIds       = "thread_posts_ids"
  show ParamTag_ByThreadPostName       = "thread_post_name"
  show ParamTag_ByThreadPostLikeId     = "thread_post_like_id"
  show ParamTag_ByThreadPostLikesIds   = "thread_post_likes_ids"
  show ParamTag_ByThreadPostStarId     = "thread_post_star_id"
  show ParamTag_ByThreadPostStarsIds   = "thread_post_stars_ids"
  show ParamTag_ByBucketId             = "bucket_id"
  show ParamTag_ByResourceId           = "resource_id"
  show ParamTag_ByResourcesIds         = "resources_ids"
  show ParamTag_ByResourceName         = "resource_name"
  show ParamTag_ByLeuronId             = "leuron_id"
  show ParamTag_ByLeuronsIds           = "leurons_ids"
  show ParamTag_ByPmId                 = "pm_id"
  show ParamTag_ByPmsIds               = "pms_ids"
  show ParamTag_ByReminderId           = "reminder_id"
  show ParamTag_ByReminderFolderId     = "reminder_folder_id"
  show ParamTag_ByParentId             = "parent_id"
  show ParamTag_ByParentsIds           = "parents_ids"
  show ParamTag_ByParentName           = "parent_name"
  show ParamTag_Timestamp              = "ts"
  show ParamTag_UnixTimestamp          = "unix_ts"
  show ParamTag_CreatedAtTimestamp     = "created_at_ts"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_ts"
  show ParamTag_RealIP                 = "real_ip"
  show ParamTag_IP                     = "ip"



instance sortOrderByShow :: Show SortOrderBy where
  show SortOrderBy_Asc  = "asc"
  show SortOrderBy_Dsc  = "dsc"
  show SortOrderBy_Rnd  = "rnd"
  show SortOrderBy_None = "none"



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
