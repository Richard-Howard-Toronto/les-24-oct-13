class Track < ApplicationRecord

  SHORT = 180000
  LONG = 360000

  scope  :short, ->  { shorter_than (SHORT)}   # a proc, only for class methods, to narrow down your query

  def self.shorter_than(milliseconds)
    where('milliseconds < ?', milliseconds)
  end

  scope :long, -> { longer_than_or_equal_to (LONG)}

  scope :medium, -> {longer_than_or_equal_to (SHORT).shorter_than(LONG)}

  scope :shorter_than, -> (milliseconds) { where ('milliseconds < ?', milliseconds)} if milliseconds.present? && milliseconds > 0 }

  scope :longer_than_or_equal_to-> (milliseconds) { where ('milliseconds ? > ?', milliseconds)}

  scope :starts_with, -> (char) { where ('name ILIKE ?', "#{ char }%") }



#
#   # def self.short
#   #   #where('milliseconds < ?', SHORT)
#   #   shorter_than(SHORT)
#   # end
#
#   def self.long
#     #where('milliseconds >= ?', LONG)
#     longer_than_or_equal_to(LONG)
#   end
#
#   def self.medium
#     #where('milliseconds >= ?', SHORT).where('milliseconds < ? ', SHORT)
#     longer_than_or_equal_to(SHORT).shorter_than(LONG)
#   end
#
#
#
#   def self.longer_than_or_equal_to(milliseconds)
#     where('milliseconds >= ?', milliseconds)
#   end
#
#   def self.starts_with(char)
#
#     where('name ILIKE ?', "#{ char }%")  #% is wildcard
#
#   end
#
#
# end
#
#
#
# # def self.short
# #   where('milliseconds < ?', SHORT)
# # end
# #
# # def self.long
# #   where('milliseconds >= ?', LONG)
# # end
# #
# # def self.medium
# #   where('milliseconds >= ?', SHORT).where('milliseconds < ? ', SHORT)
# # end
