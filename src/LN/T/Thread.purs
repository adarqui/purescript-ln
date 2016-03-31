module LN.T.Thread where



import LN.T.Prelude.Argonaut



type ThreadId = Int



threadTag :: String
threadTag = "thread"



threadsTag :: String
threadsTag = "threads"



countsThreadsTag :: String
countsThreadsTag = "counts" <> "/" <> threadsTag
