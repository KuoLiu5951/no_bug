Shoes.app do
  $mode = "Ey"
  flow do
    button 'Timer', width: 100, height: 50 do
    if $mode == "Ey"
      flow width: 200, height: 130 do

          seconds = 120
        tenths = 0
        clock =  '%02d:%02d'

        flow do
          @show = para clock % [seconds, tenths], size: 15, stroke: black
        end

        a = animate(10) do
          tenths -= 1

          if tenths < 0
            tenths  = 9
            seconds -= 1
          end

          @show.text = clock % [seconds, tenths]

          if seconds == 0 and tenths == 0
            a.stop
            alert("game over")
            close
          end

        end
        @stop = button "stop"
        @stop.click do
          a.stop
          alert("Pause")
        end
        @start = button "start"
        @start.click do
          a.start
        end

      end
    else
      flow width: 200, height: 130 do

            seconds = 60
        tenths = 0
        clock =  '%02d:%02d'

        flow do
          @show = para clock % [seconds, tenths], size: 15, stroke: black
        end

        a = animate(10) do
          tenths -= 1

          if tenths < 0
            tenths  = 9
            seconds -= 1
          end

          @show.text = clock % [seconds, tenths]

          if seconds == 0 and tenths == 0
            a.stop
            alert("game over")
            close
          end

        end
        @stop = button "stop"
        @stop.click do
          a.stop
          alert("Pause")
        end
        @start = button "start"
        @start.click do
          a.start
        end

      end

    end

    end
  end
  end

