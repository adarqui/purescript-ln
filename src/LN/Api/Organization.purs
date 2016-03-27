module LN.Api.Organization where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Organization
import LN.T.Organization.Response



getOrganizations :: ApiEff (Maybe OrganizationResponses)
getOrganizations = getAt [] [] [organizationsTag]



getOrganizationsByUserId :: String -> ApiEff (Maybe OrganizationResponses)
getOrganizationsByUserId user = getAt [] [ByUserId user] [organizationsTag]



getOrganization :: String -> ApiEff (Maybe OrganizationResponse)
getOrganization org = getAt [] [] [organizationsTag, org]
