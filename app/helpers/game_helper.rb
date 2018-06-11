module GameHelper
  def calculate_board_width
    "width: #{calculate_board}px"
  end

  def calculate_board_height
    "height: #{calculate_board}px"
  end

  private
  def calculate_board
    n = 20;
    n = 12.5 if Gon.global.size_board < 5
    space = 2.5 * (Gon.global.size_board - 1)
    width = (Gon.global.size_board * 100) + space + n
    width
  end
end
