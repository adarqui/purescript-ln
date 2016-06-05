module LN.T.User.Helpers (
  userResponseToSanitizedResponse
) where



import LN.T.Internal.Types (UserResponse (..), UserSanitizedResponse (..))


userResponseToSanitizedResponse :: UserResponse -> UserSanitizedResponse
userResponseToSanitizedResponse (UserResponse u) =
  UserSanitizedResponse {
    id:          u.id,
    nick:        u.nick,
    displayNick: u.displayNick,
    emailMD5:    u.emailMD5,
    active:      u.active,
    guard:       u.guard,
    createdAt:   u.createdAt,
    activityAt:  u.activityAt
  }
