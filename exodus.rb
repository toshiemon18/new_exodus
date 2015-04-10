# coding : utf-8

#
# Exodus
#

# 従来とは異なる製法によって全く新しい食感を提供
# 席替えを簡単化
# ボタン一つで全く新しい学習環境を提供します

require 'rubygems'
require 'gtk2'
require './gui/main_window'

window = Exodus::MainWindow.new.window_activation
