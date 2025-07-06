#### Web engineering 2025 (evening): Домашнее задание 19

1. Найдите трек с наивысшими показателями Danceability и Energy.
   db.Spotify_Youtube.find().sort({Danceability: -1, Energy: -1}).limit(1)

2. У какого трека (но не compilation) самая большая длительность?
   db.Spotify_Youtube.find({Album_type: {$ne: "compilation"}}).sort({Duration_ms: -1}).limit(1)

3. В каком одном альбоме самое большее количество треков?
   db.Spotify_Youtube.aggregate([{$match: {Album_type: "album"}}, {$group: {_id: "$Album", track_quantity: {$sum: 1}, Artist: {$first: "$Artist"}}}, {$sort: {track_quantity: -1}}, {$limit: 1}])

4. Сколько просмотров видео на youtube у трека с самым высоким количеством прослушиваний на spotify (Stream)?
   db.Spotify_Youtube.find({}, {Views: 1, Track: 1, Artist: 1, Stream: 1 }). sort({Stream: -1}).limit(1)

5. Экспортируйте 20 самых популярных (прослушивания или просмотры) треков по версиям youtube и spotify и импортируйте в базу ich_edit их с именами top20youtube и top20spotify, и добавьте им свои имена для уникальности.
    db.Spotify_Youtube.find().sort({views: -1}).limit(20)
    db.Spotify_Youtube.find().sort({stream: -1}).limit(20)
    
    db.createCollection("top20spotify_041124_Zolotukhin")
    db.createCollection("top20youtube_041124_Zolotukhin")