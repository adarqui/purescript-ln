module LN.T.Thread where



import LN.T.Prelude.Argonaut



type ThreadId = Int



threadTag :: String
threadTag = "thread"



threadsTag :: String
threadsTag = "threads"



threadStatTag :: String
threadStatTag = "thread_stat"



threadsStatsTag :: String
threadsStatsTag = "threads_stats"



countsThreadsTag :: String
countsThreadsTag = "counts" <> "/" <> threadsTag
