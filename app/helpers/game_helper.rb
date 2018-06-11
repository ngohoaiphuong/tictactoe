module GameHelper
  def calculate_board_width
    n = 20;
    n = 12.5 if Gon.global.size_board < 5
    space = 2.5 * (Gon.global.size_board - 1)
    width = (Gon.global.size_board * 100) + space + n
    "width: #{width}px"
  end
end
