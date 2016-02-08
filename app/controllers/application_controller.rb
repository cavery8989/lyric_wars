class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  
  
def gen_battle_results(song_1_title, song_1_lyrics, song_2_title, song_2_lyrics)
    
    def make_stats_hash (song_title, lyrics)
        lyrics_array = lyrics.split
            song_hist = Hash[*lyrics_array.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
            
            stats_hash = {title: song_title,
                         longest_word: lyrics_array.max_by{|word| word.size},
                         diversity: ((song_hist.keys.length.to_f)/(lyrics_array.length.to_f)*100).round(2),
                         repitition: ((song_hist.max_by{|k,v|v}[1].to_f / lyrics_array.length.to_f*100).round(2))
                        }
          p stats_hash              
        return stats_hash
    end
    
    def battle_songs(song1_stats, song2_stats)
        
        results = []
        title1 = song1_stats[:title]
        title2 = song2_stats[:title]
        
        song1_score = 0
	    song2_score = 0
	    
        song1_stats.each do |k,v|
            unless k == :title 
                if v.class == String
                    if song1_stats[k].size > song2_stats[k].size
                        p "hash 1 longer"
                        song1_score += 1
                        results << "#{title1}, #{song1_stats[k]}"
                    elsif song1_stats[k].size < song2_stats[k].size
                        p  "hash 2 longer"
                        song2_score += 1
                        results << "#{title2}, #{song2_stats[k]}"
                    else
                        p "are same size"
                    end
                else
                    if song1_stats[k] > song2_stats[k]
                        p "hash 1 bigger"
                        song1_score += 1
                        results << "#{title1}, #{song1_stats[k]}"
                    elsif song1_stats[k] < song2_stats[k]
                         p  "hash 2 bigger"
                         song2_score += 1
                        results << "#{title2}, #{song2_stats[k]}"
                    else
                        p "are same size"
                        results << "both, #{song1_stats[k]}"
                    end
                end
                        
            end
        end
        
        if song1_score > song2_score
		    results << song1_stats[:title]
	    elsif song1_score < song2_score
		    results << song2_stats[:title]
		else
		    results << "Both songs are as good as each other"
	    end
        
        return results
    	
        
    end
    
    
    song1_stats = make_stats_hash(song_1_title, song_1_lyrics)
    song2_stats = make_stats_hash(song_2_title, song_2_lyrics)
    
    return battle_songs(song1_stats, song2_stats)
end
  
end
