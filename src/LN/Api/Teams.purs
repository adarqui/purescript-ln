module LN.Api.Team where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Team
import LN.T.Team.Response



getTeams :: ApiEff (Maybe TeamResponses)
getTeams = getAt [] [] [teamsTag]



getTeam :: String -> ApiEff (Maybe TeamResponse)
getTeam team = getAt [] [] [teamsTag, team]
