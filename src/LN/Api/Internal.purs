module LN.Api.Internal where


import Purescript.Api.Helpers
import Prelude
import Data.Either
import Data.Tuple

import Prelude
import Data.Either
import LN.T.Internal.Types

getApis :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ApiResponses)
getApis params = handleError <$> getAt params ["apis"]

getApis' :: ApiEff (Either ApiError ApiResponses)
getApis'  = handleError <$> getAt ([] :: Array Boolean) ["apis"]

postApi :: forall qp. QueryParam qp => Array qp -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi params api_request = handleError <$> postAt params ["api"] api_request

postApi' :: ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi' api_request = handleError <$> postAt ([] :: Array Boolean) ["api"] api_request

getApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ApiResponse)
getApi params api_id = handleError <$> getAt params ["api", show api_id]

getApi' :: Int -> ApiEff (Either ApiError ApiResponse)
getApi' api_id = handleError <$> getAt ([] :: Array Boolean) ["api", show api_id]

putApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi params api_id api_request = handleError <$> putAt params ["api", show api_id] api_request

putApi' :: Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi' api_id api_request = handleError <$> putAt ([] :: Array Boolean) ["api", show api_id] api_request

deleteApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteApi params api_id = handleError <$> deleteAt params ["api", show api_id]

deleteApi' :: Int -> ApiEff (Either ApiError Unit)
deleteApi' api_id = handleError <$> deleteAt ([] :: Array Boolean) ["api", show api_id]

getBoards :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardResponses)
getBoards params = handleError <$> getAt params ["boards"]

getBoards' :: ApiEff (Either ApiError BoardResponses)
getBoards'  = handleError <$> getAt ([] :: Array Boolean) ["boards"]

postBoard :: forall qp. QueryParam qp => Array qp -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard params board_request = handleError <$> postAt params ["board"] board_request

postBoard' :: BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard' board_request = handleError <$> postAt ([] :: Array Boolean) ["board"] board_request

getBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard params board_id = handleError <$> getAt params ["board", show board_id]

getBoard' :: Int -> ApiEff (Either ApiError BoardResponse)
getBoard' board_id = handleError <$> getAt ([] :: Array Boolean) ["board", show board_id]

putBoard :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard params board_id board_request = handleError <$> putAt params ["board", show board_id] board_request

putBoard' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard' board_id board_request = handleError <$> putAt ([] :: Array Boolean) ["board", show board_id] board_request

deleteBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteBoard params board_id = handleError <$> deleteAt params ["board", show board_id]

deleteBoard' :: Int -> ApiEff (Either ApiError Unit)
deleteBoard' board_id = handleError <$> deleteAt ([] :: Array Boolean) ["board", show board_id]

getBoardStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardStatResponses)
getBoardStats params = handleError <$> getAt params ["board_stats"]

getBoardStats' :: ApiEff (Either ApiError BoardStatResponses)
getBoardStats'  = handleError <$> getAt ([] :: Array Boolean) ["board_stats"]

getBoardStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat params board_id = handleError <$> getAt params ["board_stat", show board_id]

getBoardStat' :: Int -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat' board_id = handleError <$> getAt ([] :: Array Boolean) ["board_stat", show board_id]

getForums :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumResponses)
getForums params = handleError <$> getAt params ["forums"]

getForums' :: ApiEff (Either ApiError ForumResponses)
getForums'  = handleError <$> getAt ([] :: Array Boolean) ["forums"]

postForum :: forall qp. QueryParam qp => Array qp -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum params forum_request = handleError <$> postAt params ["forum"] forum_request

postForum' :: ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum' forum_request = handleError <$> postAt ([] :: Array Boolean) ["forum"] forum_request

getForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponse)
getForum params forum_id = handleError <$> getAt params ["forum", show forum_id]

getForum' :: Int -> ApiEff (Either ApiError ForumResponse)
getForum' forum_id = handleError <$> getAt ([] :: Array Boolean) ["forum", show forum_id]

putForum :: forall qp. QueryParam qp => Array qp -> Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum params forum_id forum_request = handleError <$> putAt params ["forum", show forum_id] forum_request

putForum' :: Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum' forum_id forum_request = handleError <$> putAt ([] :: Array Boolean) ["forum", show forum_id] forum_request

deleteForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteForum params forum_id = handleError <$> deleteAt params ["forum", show forum_id]

deleteForum' :: Int -> ApiEff (Either ApiError Unit)
deleteForum' forum_id = handleError <$> deleteAt ([] :: Array Boolean) ["forum", show forum_id]

getForumStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumStatResponses)
getForumStats params = handleError <$> getAt params ["forum_stats"]

getForumStats' :: ApiEff (Either ApiError ForumStatResponses)
getForumStats'  = handleError <$> getAt ([] :: Array Boolean) ["forum_stats"]

getForumStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumStatResponse)
getForumStat params forum_id = handleError <$> getAt params ["forum_stat", show forum_id]

getForumStat' :: Int -> ApiEff (Either ApiError ForumStatResponse)
getForumStat' forum_id = handleError <$> getAt ([] :: Array Boolean) ["forum_stat", show forum_id]

getLeurons :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff (Either ApiError LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: Array Boolean) ["leurons"]

postLeuron :: forall qp. QueryParam qp => Array qp -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron params leuron_request = handleError <$> postAt params ["leuron"] leuron_request

postLeuron' :: LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron' leuron_request = handleError <$> postAt ([] :: Array Boolean) ["leuron"] leuron_request

getLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronResponse)
getLeuron params leuron_id = handleError <$> getAt params ["leuron", show leuron_id]

getLeuron' :: Int -> ApiEff (Either ApiError LeuronResponse)
getLeuron' leuron_id = handleError <$> getAt ([] :: Array Boolean) ["leuron", show leuron_id]

putLeuron :: forall qp. QueryParam qp => Array qp -> Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron params leuron_id leuron_request = handleError <$> putAt params ["leuron", show leuron_id] leuron_request

putLeuron' :: Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron' leuron_id leuron_request = handleError <$> putAt ([] :: Array Boolean) ["leuron", show leuron_id] leuron_request

deleteLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteLeuron params leuron_id = handleError <$> deleteAt params ["leuron", show leuron_id]

deleteLeuron' :: Int -> ApiEff (Either ApiError Unit)
deleteLeuron' leuron_id = handleError <$> deleteAt ([] :: Array Boolean) ["leuron", show leuron_id]

getMe :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponse)
getMe params = handleError <$> getAt params ["me"]

getMe' :: ApiEff (Either ApiError UserResponse)
getMe'  = handleError <$> getAt ([] :: Array Boolean) ["me"]

getMePack :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponse)
getMePack params = handleError <$> getAt params ["me_pack"]

getMePack' :: ApiEff (Either ApiError UserPackResponse)
getMePack'  = handleError <$> getAt ([] :: Array Boolean) ["me_pack"]

getOrganizations :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationResponses)
getOrganizations params = handleError <$> getAt params ["organizations"]

getOrganizations' :: ApiEff (Either ApiError OrganizationResponses)
getOrganizations'  = handleError <$> getAt ([] :: Array Boolean) ["organizations"]

postOrganization :: forall qp. QueryParam qp => Array qp -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization params organization_request = handleError <$> postAt params ["organization"] organization_request

postOrganization' :: OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization' organization_request = handleError <$> postAt ([] :: Array Boolean) ["organization"] organization_request

getOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_id = handleError <$> getAt params ["organization", show organization_id]

getOrganization' :: Int -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization", show organization_id]

putOrganization :: forall qp. QueryParam qp => Array qp -> Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization params organization_id organization_request = handleError <$> putAt params ["organization", show organization_id] organization_request

putOrganization' :: Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization' organization_id organization_request = handleError <$> putAt ([] :: Array Boolean) ["organization", show organization_id] organization_request

deleteOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteOrganization params organization_id = handleError <$> deleteAt params ["organization", show organization_id]

deleteOrganization' :: Int -> ApiEff (Either ApiError Unit)
deleteOrganization' organization_id = handleError <$> deleteAt ([] :: Array Boolean) ["organization", show organization_id]

getOrganizationStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats params = handleError <$> getAt params ["organization_stats"]

getOrganizationStats' :: ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats'  = handleError <$> getAt ([] :: Array Boolean) ["organization_stats"]

getOrganizationStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat params organization_id = handleError <$> getAt params ["organization_stat", show organization_id]

getOrganizationStat' :: Int -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization_stat", show organization_id]

getPms :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmResponses)
getPms params = handleError <$> getAt params ["pms"]

getPms' :: ApiEff (Either ApiError PmResponses)
getPms'  = handleError <$> getAt ([] :: Array Boolean) ["pms"]

postPm :: forall qp. QueryParam qp => Array qp -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm params pm_request = handleError <$> postAt params ["pm"] pm_request

postPm' :: PmRequest -> ApiEff (Either ApiError PmResponse)
postPm' pm_request = handleError <$> postAt ([] :: Array Boolean) ["pm"] pm_request

getPm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmResponse)
getPm params pm_id = handleError <$> getAt params ["pm", show pm_id]

getPm' :: Int -> ApiEff (Either ApiError PmResponse)
getPm' pm_id = handleError <$> getAt ([] :: Array Boolean) ["pm", show pm_id]

putPm :: forall qp. QueryParam qp => Array qp -> Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm params pm_id pm_request = handleError <$> putAt params ["pm", show pm_id] pm_request

putPm' :: Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm' pm_id pm_request = handleError <$> putAt ([] :: Array Boolean) ["pm", show pm_id] pm_request

deletePm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePm params pm_id = handleError <$> deleteAt params ["pm", show pm_id]

deletePm' :: Int -> ApiEff (Either ApiError Unit)
deletePm' pm_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm", show pm_id]

getPmIns :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmInResponses)
getPmIns params = handleError <$> getAt params ["pm_ins"]

getPmIns' :: ApiEff (Either ApiError PmInResponses)
getPmIns'  = handleError <$> getAt ([] :: Array Boolean) ["pm_ins"]

postPmIn :: forall qp. QueryParam qp => Array qp -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn params pm_in_request = handleError <$> postAt params ["pm_in"] pm_in_request

postPmIn' :: PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn' pm_in_request = handleError <$> postAt ([] :: Array Boolean) ["pm_in"] pm_in_request

getPmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmInResponse)
getPmIn params pm_in_id = handleError <$> getAt params ["pm_in", show pm_in_id]

getPmIn' :: Int -> ApiEff (Either ApiError PmInResponse)
getPmIn' pm_in_id = handleError <$> getAt ([] :: Array Boolean) ["pm_in", show pm_in_id]

putPmIn :: forall qp. QueryParam qp => Array qp -> Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn params pm_in_id pm_in_request = handleError <$> putAt params ["pm_in", show pm_in_id] pm_in_request

putPmIn' :: Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn' pm_in_id pm_in_request = handleError <$> putAt ([] :: Array Boolean) ["pm_in", show pm_in_id] pm_in_request

deletePmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePmIn params pm_in_id = handleError <$> deleteAt params ["pm_in", show pm_in_id]

deletePmIn' :: Int -> ApiEff (Either ApiError Unit)
deletePmIn' pm_in_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm_in", show pm_in_id]

getPmOuts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmOutResponses)
getPmOuts params = handleError <$> getAt params ["pm_outs"]

getPmOuts' :: ApiEff (Either ApiError PmOutResponses)
getPmOuts'  = handleError <$> getAt ([] :: Array Boolean) ["pm_outs"]

postPmOut :: forall qp. QueryParam qp => Array qp -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut params pm_out_request = handleError <$> postAt params ["pm_out"] pm_out_request

postPmOut' :: PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut' pm_out_request = handleError <$> postAt ([] :: Array Boolean) ["pm_out"] pm_out_request

getPmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmOutResponse)
getPmOut params pm_out_id = handleError <$> getAt params ["pm_out", show pm_out_id]

getPmOut' :: Int -> ApiEff (Either ApiError PmOutResponse)
getPmOut' pm_out_id = handleError <$> getAt ([] :: Array Boolean) ["pm_out", show pm_out_id]

putPmOut :: forall qp. QueryParam qp => Array qp -> Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut params pm_out_id pm_out_request = handleError <$> putAt params ["pm_out", show pm_out_id] pm_out_request

putPmOut' :: Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut' pm_out_id pm_out_request = handleError <$> putAt ([] :: Array Boolean) ["pm_out", show pm_out_id] pm_out_request

deletePmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePmOut params pm_out_id = handleError <$> deleteAt params ["pm_out", show pm_out_id]

deletePmOut' :: Int -> ApiEff (Either ApiError Unit)
deletePmOut' pm_out_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm_out", show pm_out_id]

getResources :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ResourceResponses)
getResources params = handleError <$> getAt params ["resources"]

getResources' :: ApiEff (Either ApiError ResourceResponses)
getResources'  = handleError <$> getAt ([] :: Array Boolean) ["resources"]

postResource :: forall qp. QueryParam qp => Array qp -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource params resource_request = handleError <$> postAt params ["resource"] resource_request

postResource' :: ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource' resource_request = handleError <$> postAt ([] :: Array Boolean) ["resource"] resource_request

getResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceResponse)
getResource params resource_id = handleError <$> getAt params ["resource", show resource_id]

getResource' :: Int -> ApiEff (Either ApiError ResourceResponse)
getResource' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource", show resource_id]

putResource :: forall qp. QueryParam qp => Array qp -> Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource params resource_id resource_request = handleError <$> putAt params ["resource", show resource_id] resource_request

putResource' :: Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource' resource_id resource_request = handleError <$> putAt ([] :: Array Boolean) ["resource", show resource_id] resource_request

deleteResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteResource params resource_id = handleError <$> deleteAt params ["resource", show resource_id]

deleteResource' :: Int -> ApiEff (Either ApiError Unit)
deleteResource' resource_id = handleError <$> deleteAt ([] :: Array Boolean) ["resource", show resource_id]

getTeams :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamResponses)
getTeams params = handleError <$> getAt params ["teams"]

getTeams' :: ApiEff (Either ApiError TeamResponses)
getTeams'  = handleError <$> getAt ([] :: Array Boolean) ["teams"]

postTeam :: forall qp. QueryParam qp => Array qp -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam params team_request = handleError <$> postAt params ["team"] team_request

postTeam' :: TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam' team_request = handleError <$> postAt ([] :: Array Boolean) ["team"] team_request

getTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamResponse)
getTeam params team_id = handleError <$> getAt params ["team", show team_id]

getTeam' :: Int -> ApiEff (Either ApiError TeamResponse)
getTeam' team_id = handleError <$> getAt ([] :: Array Boolean) ["team", show team_id]

putTeam :: forall qp. QueryParam qp => Array qp -> Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam params team_id team_request = handleError <$> putAt params ["team", show team_id] team_request

putTeam' :: Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam' team_id team_request = handleError <$> putAt ([] :: Array Boolean) ["team", show team_id] team_request

deleteTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteTeam params team_id = handleError <$> deleteAt params ["team", show team_id]

deleteTeam' :: Int -> ApiEff (Either ApiError Unit)
deleteTeam' team_id = handleError <$> deleteAt ([] :: Array Boolean) ["team", show team_id]

getThreads :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadResponses)
getThreads params = handleError <$> getAt params ["threads"]

getThreads' :: ApiEff (Either ApiError ThreadResponses)
getThreads'  = handleError <$> getAt ([] :: Array Boolean) ["threads"]

postThread :: forall qp. QueryParam qp => Array qp -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread params thread_request = handleError <$> postAt params ["thread"] thread_request

postThread' :: ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread' thread_request = handleError <$> postAt ([] :: Array Boolean) ["thread"] thread_request

getThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread params thread_id = handleError <$> getAt params ["thread", show thread_id]

getThread' :: Int -> ApiEff (Either ApiError ThreadResponse)
getThread' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread", show thread_id]

putThread :: forall qp. QueryParam qp => Array qp -> Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread params thread_id thread_request = handleError <$> putAt params ["thread", show thread_id] thread_request

putThread' :: Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread' thread_id thread_request = handleError <$> putAt ([] :: Array Boolean) ["thread", show thread_id] thread_request

deleteThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThread params thread_id = handleError <$> deleteAt params ["thread", show thread_id]

deleteThread' :: Int -> ApiEff (Either ApiError Unit)
deleteThread' thread_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread", show thread_id]

getThreadStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadStatResponses)
getThreadStats params = handleError <$> getAt params ["thread_stats"]

getThreadStats' :: ApiEff (Either ApiError ThreadStatResponses)
getThreadStats'  = handleError <$> getAt ([] :: Array Boolean) ["thread_stats"]

getThreadStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat params thread_id = handleError <$> getAt params ["thread_stat", show thread_id]

getThreadStat' :: Int -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread_stat", show thread_id]

getThreadPosts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts params = handleError <$> getAt params ["thread_posts"]

getThreadPosts' :: ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts'  = handleError <$> getAt ([] :: Array Boolean) ["thread_posts"]

postThreadPost :: forall qp. QueryParam qp => Array qp -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost params thread_post_request = handleError <$> postAt params ["thread_post"] thread_post_request

postThreadPost' :: ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost' thread_post_request = handleError <$> postAt ([] :: Array Boolean) ["thread_post"] thread_post_request

getThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost params thread_post_id = handleError <$> getAt params ["thread_post", show thread_post_id]

getThreadPost' :: Int -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post", show thread_post_id]

putThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost params thread_post_id thread_post_request = handleError <$> putAt params ["thread_post", show thread_post_id] thread_post_request

putThreadPost' :: Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost' thread_post_id thread_post_request = handleError <$> putAt ([] :: Array Boolean) ["thread_post", show thread_post_id] thread_post_request

deleteThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThreadPost params thread_post_id = handleError <$> deleteAt params ["thread_post", show thread_post_id]

deleteThreadPost' :: Int -> ApiEff (Either ApiError Unit)
deleteThreadPost' thread_post_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread_post", show thread_post_id]

getThreadPostStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats params = handleError <$> getAt params ["thread_post_stats"]

getThreadPostStats' :: ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats'  = handleError <$> getAt ([] :: Array Boolean) ["thread_post_stats"]

getThreadPostStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat params thread_post_id = handleError <$> getAt params ["thread_post_stat", show thread_post_id]

getThreadPostStat' :: Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_stat", show thread_post_id]

getUsers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponses)
getUsers params = handleError <$> getAt params ["users"]

getUsers' :: ApiEff (Either ApiError UserResponses)
getUsers'  = handleError <$> getAt ([] :: Array Boolean) ["users"]

getUsers_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users"]

getUsers_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users"]

getUsers_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array  String) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users"]

getUsers_ByUsersNicks' :: (Array  String) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users"]

postUser :: forall qp. QueryParam qp => Array qp -> UserRequest -> ApiEff (Either ApiError UserResponse)
postUser params user_request = handleError <$> postAt params ["user"] user_request

postUser' :: UserRequest -> ApiEff (Either ApiError UserResponse)
postUser' user_request = handleError <$> postAt ([] :: Array Boolean) ["user"] user_request

getUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserResponse)
getUser params user_id = handleError <$> getAt params ["user", show user_id]

getUser' :: Int -> ApiEff (Either ApiError UserResponse)
getUser' user_id = handleError <$> getAt ([] :: Array Boolean) ["user", show user_id]

putUser :: forall qp. QueryParam qp => Array qp -> Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser params user_id user_request = handleError <$> putAt params ["user", show user_id] user_request

putUser' :: Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser' user_id user_request = handleError <$> putAt ([] :: Array Boolean) ["user", show user_id] user_request

deleteUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteUser params user_id = handleError <$> deleteAt params ["user", show user_id]

deleteUser' :: Int -> ApiEff (Either ApiError Unit)
deleteUser' user_id = handleError <$> deleteAt ([] :: Array Boolean) ["user", show user_id]

getUsersSanitized :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized params = handleError <$> getAt params ["users_sanitized"]

getUsersSanitized' :: ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized'  = handleError <$> getAt ([] :: Array Boolean) ["users_sanitized"]

getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users_sanitized"]

getUsersSanitized_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users_sanitized"]

getUsersSanitized_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array  String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users_sanitized"]

getUsersSanitized_ByUsersNicks' :: (Array  String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users_sanitized"]

getUserSanitized :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized params user_id = handleError <$> getAt params ["user_sanitized", show user_id]

getUserSanitized' :: Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized", show user_id]

getBoardPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks params = handleError <$> getAt params ["board_packs"]

getBoardPacks' :: ApiEff (Either ApiError BoardPackResponses)
getBoardPacks'  = handleError <$> getAt ([] :: Array Boolean) ["board_packs"]

getBoardPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_packs"]

getBoardPacks_ByForumId' :: Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_packs"]

getBoardPacks_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["board_packs"]

getBoardPacks_ByBoardsIds' :: (Array  Int) -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["board_packs"]

getBoardPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack params board_id = handleError <$> getAt params ["board_pack", show board_id]

getBoardPack' :: Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack' board_id = handleError <$> getAt ([] :: Array Boolean) ["board_pack", show board_id]

getOrganizationPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks params = handleError <$> getAt params ["organization_packs"]

getOrganizationPacks' :: ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks'  = handleError <$> getAt ([] :: Array Boolean) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds params _ByOrganizationsIds = handleError <$> getAt (map qp params ++ map qp [ByOrganizationsIds _ByOrganizationsIds]) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds' :: (Array  Int) -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds' _ByOrganizationsIds = handleError <$> getAt [ByOrganizationsIds _ByOrganizationsIds] ["organization_packs"]

getOrganizationPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_id = handleError <$> getAt params ["organization_pack", show organization_id]

getOrganizationPack' :: Int -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization_pack", show organization_id]

getThreadPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks params = handleError <$> getAt params ["thread_packs"]

getThreadPacks' :: ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks'  = handleError <$> getAt ([] :: Array Boolean) ["thread_packs"]

getThreadPacks_ByThreadsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds params _ByThreadsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadsIds _ByThreadsIds]) ["thread_packs"]

getThreadPacks_ByThreadsIds' :: (Array  Int) -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds' _ByThreadsIds = handleError <$> getAt [ByThreadsIds _ByThreadsIds] ["thread_packs"]

getThreadPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack params thread_id = handleError <$> getAt params ["thread_pack", show thread_id]

getThreadPack' :: Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread_pack", show thread_id]

getThreadPostPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks params = handleError <$> getAt params ["thread_post_packs"]

getThreadPostPacks' :: ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks'  = handleError <$> getAt ([] :: Array Boolean) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_packs"]

getThreadPostPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack params thread_post_id = handleError <$> getAt params ["thread_post_pack", show thread_post_id]

getThreadPostPack' :: Int -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_pack", show thread_post_id]

getUserPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponses)
getUserPacks params = handleError <$> getAt params ["user_packs"]

getUserPacks' :: ApiEff (Either ApiError UserPackResponses)
getUserPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_packs"]

getUserPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_packs"]

getUserPacks_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_packs"]

getUserPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack params user_id = handleError <$> getAt params ["user_pack", show user_id]

getUserPack' :: Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_pack", show user_id]

getUserSanitizedPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks params = handleError <$> getAt params ["user_sanitized_packs"]

getUserSanitizedPacks' :: ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersSanitizedIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersSanitizedIds params _ByUsersSanitizedIds = handleError <$> getAt (map qp params ++ map qp [ByUsersSanitizedIds _ByUsersSanitizedIds]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersSanitizedIds' :: (Array  Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersSanitizedIds' _ByUsersSanitizedIds = handleError <$> getAt [ByUsersSanitizedIds _ByUsersSanitizedIds] ["user_sanitized_packs"]

getUsersSanitizedPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUsersSanitizedPack params user_sanitized_id = handleError <$> getAt params ["users_sanitized_pack", show user_sanitized_id]

getUsersSanitizedPack' :: Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUsersSanitizedPack' user_sanitized_id = handleError <$> getAt ([] :: Array Boolean) ["users_sanitized_pack", show user_sanitized_id]

-- footer