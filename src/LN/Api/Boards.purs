module LN.Api.Board where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Board
import LN.T.Board.Response



getBoards :: ApiEff (Maybe BoardResponses)
getBoards = getAt [] [] [boardsTag]



-- change For / By
getBoardsByForumId :: String -> ApiEff (Maybe BoardResponses)
getBoardsByForumId forum = getAt [] [ByForumId forum] [boardsTag]



getBoard :: String -> ApiEff (Maybe BoardResponse)
getBoard board_id = getAt [] [] [boardsTag, board_id]



