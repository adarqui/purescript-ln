module LN.Api.Board where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Board
import LN.T.Board.Response



getBoards :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe BoardResponses)
getBoards = getAt [] [] [boardsTag]



getBoard :: forall eff. String -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe BoardResponse)
getBoard board_id = getAt [] [] [boardsTag, board_id]
