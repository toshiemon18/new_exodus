# 
# Exodus::GeneralGUI
# 

# Exodusのメインウィンドウのレイアウトの組み立てを行う

require 'rubygems'
require 'gtk2'
require './gui/seat_table'
require './gui/exit_button'

module Exodus
	class GeneralGUI
		def initialize
			@ui_box = Gtk::VBox.new(false, 10)
		end

		def assemble_gui_layout
			top_line_layout = Gtk::VBox.new(false, 0)
			exit_button = Exodus::ExitButton.new.exit_button
			priority_bad_eyesighter_entry = Gtk::Entry.new
			priority_bad_eyesighter_entry.set_editable(true)

			start_button = Gtk::Button.new("Exodus Start")
			start_button.signal_connect("clicked") do
				seat_table = Exodus::SeatTable.new(5, 6, priority_bad_eyesighter_entry.text.split(","))
				seat_table.show_sub_window
			end

			layout_keeper_box = Gtk::HBox.new(true, 0)
			empty_box = Gtk::HBox.new(false,0)

			layout_keeper_box.pack_end(exit_button, false, false, 150)

			top_line_layout.pack_end(layout_keeper_box, false, false, 10)
			top_line_layout.pack_end(empty_box, false, false, 0)
			top_line_layout.pack_end(Gtk::HBox.new(false, 0).pack_end(start_button, true, false, 150), true, false, 10)
			top_line_layout.pack_end(priority_bad_eyesighter_entry, false, false, 10)
			@ui_box.pack_end(top_line_layout, true, false)
		end
	end
end
