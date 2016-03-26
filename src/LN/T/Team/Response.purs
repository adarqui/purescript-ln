module LN.T.Team.Response where



import LN.T.Prelude
import LN.T.Prelude.Argonaut
import LN.T.Team
import LN.T.DateMaybe



newtype TeamResponse = TeamResponse {
  id   :: TeamId,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: Maybe String,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}



defaultTeamResponse :: TeamResponse
defaultTeamResponse = mkTeamResponse 0 0 0 "name" Nothing defaultDate Nothing defaultDate



mkTeamResponse :: Int -> Int -> Int -> String -> Maybe String -> DateMaybe -> Maybe Int -> DateMaybe -> TeamResponse
mkTeamResponse id userId orgId name description createdAt modifiedBy modifiedAt =
  TeamResponse { id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt }



instance encodeTeamResponse :: EncodeJson TeamResponse where
  encodeJson (TeamResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "org_id" := u.orgId
    ~> "name"  := u.name
    ~> "desc" := u.description
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeTeamResponse :: DecodeJson TeamResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    name <- obj .? "name"
    description <- obj .? "description"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ TeamResponse {id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt}



instance respondableTeamResponse :: Respondable TeamResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkTeamResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableTeamResponse :: Requestable TeamResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignTeamResponse :: IsForeign TeamResponse where
  read f = mkTeamResponse
    <$> readProp "id" f
    <*> readProp "user_id" f
    <*> readProp "org_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "description" f)
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
    <*> readProp "modified_at" f







newtype TeamResponses = TeamResponses {
  teams :: Array TeamResponse
}

defaultTeamResponses :: TeamResponses
defaultTeamResponses = mkTeamResponses

mkTeamResponses :: TeamResponses
mkTeamResponses = TeamResponses { teams: [] }

instance encodeTeamResponses :: EncodeJson TeamResponses where
  encodeJson (TeamResponses u) =
       "teams"    := u.teams
    ~> jsonEmptyObject

instance decodeTeamResponses :: DecodeJson TeamResponses where
  decodeJson json = do
    obj <- decodeJson json
    teams <- obj .? "teams"
    pure $ TeamResponses { teams: teams }

instance respondableTeamResponses :: Respondable TeamResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    teams <- readProp "teams" json
    pure $ TeamResponses { teams: teams }

instance requestableTeamResponses :: Requestable TeamResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignTeamResponses :: IsForeign TeamResponses where
  read f = do
    teams <- readProp "teams" f
    pure $ TeamResponses { teams: teams }
