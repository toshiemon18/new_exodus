# 
# Exodus::MainWindow
# 

# Exodusの親ウィンドウの生成とアクティベートを行う

require 'rubygems'
require 'gtk2'
require './gui/general_gui'

module Exodus

	class MainWindow

		W_WIDTH = 350
		W_HEIGHT = 150

		def initialize
			@main_window_ = window_setup
		end

		def window_setup
			w = Gtk::Window.new("Exodus")
			w.signal_connect("destroy", "delete_event") { Gtk.main_quit }
			w.set_size_request(W_WIDTH, W_HEIGHT)
		end

		def window_activation
			layout = Exodus::GeneralGUI.new.assemble_gui_layout
			@main_window_.add(layout)
			@main_window_.show_all
			Gtk.main
		end

	end

end