#
# Exodus::ExitButton
#

# ノンフライ終了ボタン

# Exodus::ExitButton.exit_button　で使える

require 'rubygems'
require 'gtk2'

module Exodus

	class ExitButton

		FONT_SIZE = 10

		def set_button_font_style(button_object)
			style = Gtk::Style.new
			style.font_desc = Pango::FontDescription.new("Sans #{FONT_SIZE}")
			button_object.child.style = style
		end

		def  exit_button(gtk_object=nil)
			b = Gtk::Button.new(" Exit ")
			b.signal_connect("clicked") do 
				gtk_object.destroy if gtk_object != nil
				Gtk.main_quit if gtk_object == nil
			end
			set_button_font_style(b)
			return b
		end

	end

end