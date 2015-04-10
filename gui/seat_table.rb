# 
# Exodus::SeatTable
# 

# 席の位置と苗字のデータを持ったテキストエントリをGtk::Tableに格納する

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'gtk2'
require './lib/new_seat_generator'
require './gui/exit_button'

module Exodus

	class SeatTable

		def initialize(width, height, target_name)
			@width_ = width
			@height_ = height
			@target_name_ = target_name
		end

		def attach_some_entries
			seat_table = Gtk::Table.new(@width_, @height_, true)
			entry_object_array = Exodus::NewSeatGenerator.new.generate(Time::now.nsec, @target_name_)
			w = 0 
			h = 0
			entry_object_array.each do |entry|
				seat_table.attach(entry, w, w+1, h, h+1, xop = Gtk::FILL|Gtk::EXPAND, yop = Gtk::FILL|Gtk::EXPAND, 5, 5)
				w += 1
				if w >= @width_ then 
					h += 1
					w = 0
				end
			end

			return seat_table
		end

		def assemble_sub_window_layout
			win = Gtk::Window.new("New Seat Table")
			win.border_width = 15
			win.signal_connect("destroy") { win.destroy }

			label = Gtk::Label.new("Front" ,use_underline = nil)
			label.set_justify(Gtk::JUSTIFY_CENTER)

			sub_window_layout = Gtk::VBox.new(false,10)
			exit_button = Exodus::ExitButton.new.exit_button(win)
			button_positioning_box = Gtk::HBox.new(true,0)
			button_positioning_box.pack_start(exit_button,false,false,200)

			seat_table = attach_some_entries

			sub_window_layout.pack_end(button_positioning_box, true, false, 10)
			sub_window_layout.pack_end(seat_table, true, false, 5)
			sub_window_layout.pack_end(label, false, false, 5)
			sub_window_layout.pack_end(exit_button, false, false)

			win.add(sub_window_layout)
		end

		def show_sub_window
			win = assemble_sub_window_layout
			win.show_all
		end

	end

end