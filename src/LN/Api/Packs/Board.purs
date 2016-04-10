module LN.Api.Packs.Board where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Pack.Board



getBoardsPacks :: ApiEff (Maybe BoardPackResponses)
getBoardsPacks = getAt [] [] [boardsPacksTag]



getBoardsPacksByForumId :: String -> ApiEff (Maybe BoardPackResponses)
getBoardsPacksByForumId forum = getAt [] [ByForumId forum] [boardsPacksTag]



getBoardPack :: String -> ApiEff (Maybe BoardPackResponse)
getBoardPack board_id = getAt [] [] [boardsPacksTag, board_id]



getBoardPackByForumId :: String -> String -> ApiEff (Maybe BoardPackResponse)
getBoardPackByForumId forum board = getAt [] [ByForumId forum] [boardsPacksTag, board]
