#
# Exodus::NewSeatGenerator
#

# MT19937に基づく擬似乱数生成器を用いて席替えを行う
# シャッフルはメルセンヌツイスタに基づく擬似乱数生成器を生成して行います。
# 擬似乱数生成器のシード値は以下のフォーマットで定義するものとします。
# hhmmss (h : Hour, m : Minute, s : Second)

require 'rubygems'
require 'gtk2'

$:.unshift File.dirname(__FILE__)

module Exodus
	class NewSeatGenerator
    attr_accessor :name_array
		def load_students_name
			students = []
      begin
			  File.open("./bin/student_list", encoding: "utf-8").read.each_line { |line| students << line.to_s unless line.empty? }
      rescue => e
        puts "#{e} : Please prepare students list in bin/"
      end
      return students
		end

		# 黒板が見えなくて前の席を確保したい人のための機能
		def removal_bad_eyesight(name_array, eject_target)
			eject_target.each { |t| name_array.delete(t.to_s) }
			return name_array
		end

    def save_new_seat(new_seat)
      file = File.open("./bin/student_list", "w") do |line|
        new_seat.each { |e| line.puts e }
      end
    end

		# Array#shuffle!(random: rng)を使う
		def generate(hhmmss, bad_eyesighter_names)
      self.name_array = removal_bad_eyesight(load_students_name, bad_eyesighter_names)
      self.name_array.shuffle!#(random: Random.new(hhmmss.to_i))
			# name_array = load_students_name.shuffle!(random: Random.new(hhmmss.to_i))
			entry_object_array = []
      self.name_array.each do |name|
				entry = Gtk::Entry.new
				entry.set_text("            " + name.to_s)
				entry.set_editable(false)
				entry_object_array << entry
			end

			return entry_object_array
		end
	end
end
