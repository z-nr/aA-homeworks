class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    album_with_counts =
      albums
      .select('albums.*, COUNT(*) AS count')
      .joins(:tracks)
      .group('albums.id')

    album_hash = {}
    album_with_counts.each do |album|
      album_hash[album.title] = album.count
    end

    album_hash
  end
end