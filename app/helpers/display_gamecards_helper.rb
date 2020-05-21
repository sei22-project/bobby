module DisplayGamecards
  def show_cards(game)
    return
      "<div style='border: 1px solid black;'>
        <p>
            <%=get_category(#{game.category_id})%>
        </p>
        <p>
            <%=#{game.title}%>
        </p>
        <p>
            <%=#{game.start.strftime('%d %b') if game.start}%>
        </p>
        <p> Start time:
            <%=#{game.start.strftime('%H:%M') if game.start}%>
        </p>
        <p> End time:
            <%=#{game.end.strftime('%H:%M') if game.end}%>
        </p>
        <p>
            <%=#{game.venue}%>
        </p>
        <p> Players required:
            <%=#{game.players_required}%>
        </p>
      </div>"
end