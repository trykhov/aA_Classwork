# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string
#  short_url :string
#


class ShortenedUrl < ActiveRecord::Base
  
end
