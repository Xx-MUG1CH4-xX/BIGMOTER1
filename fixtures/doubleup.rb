require 'dxruby'

# ウィンドウの設定
Window.caption = "Double Up Game"
Window.width = 1000
Window.height = 750

# 初期の賭け金とベット額
money = 100
bet_amount = money

# フォントの設定
font = Font.new(48)

# ゲームループ
Window.loop do
  # 背景を描画
  Window.draw(0, 0, Image.new(Window.width, Window.height, [255, 255, 255]))

  # 賭け金とベット額を表示
  Window.draw_font(10, 10, "Money: #{money} yen", font, color: [0, 0, 0])
  Window.draw_font(10, 50, "Bet Amount: #{bet_amount} yen", font, color: [0, 0, 0])

  # ダブルアップの選択肢を表示
  Window.draw_font(200, 200, "1. Double Up", font, color: [0, 0, 0])
  Window.draw_font(200, 250, "2. Quit", font, color: [0, 0, 0])

  # イベントハンドリング
  if Input.key_push?(K_1)
    # ダブルアップを選択した場合
    result = rand(2)  # ランダムに1か2を選ぶ
    if result == 1
      money == bet_amount * 2  # 勝った場合、賭け金を倍にする
    else
      money -= bet_amount  # 負けた場合、賭け金を失う
    end
  elsif Input.key_push?(K_2)
    # Quitを選択した場合、ゲームを終了
    break
  end

  # ゲームオーバー判定
  if money <= 0
    Window.draw_font(200, 300, "Game Over!", font, color: [255, 0, 0])
  end
end

# ゲーム終了
Window.close
