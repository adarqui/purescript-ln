module LN.T.ThreadPost.Stat (
  defaultThreadPostStatResponse
) where



import LN.T.Internal.Types (ThreadPostStatResponse, mkThreadPostStatResponse)



defaultThreadPostStatResponse :: ThreadPostStatResponse
defaultThreadPostStatResponse = mkThreadPostStatResponse 0 0 0 0 0 0
