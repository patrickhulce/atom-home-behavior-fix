module.exports =
  activate: ->
    atom.workspaceView.command "home-behavior-fix:home", => @moveToHome()

  moveToHome: ->
    editor = atom.workspace.activePaneItem
    console.log(editor.buffer.getMarkers())
    handleCursor = (cursor) ->
      startingPosition = cursor.getBufferColumn()
      currentLine = cursor.getCurrentBufferLine()
      cursor.moveToBeginningOfLine()
      cursor.moveToNextWordBoundary()
      if cursor.getBufferColumn() == startingPosition or currentLine.match(/^[^\s]/)
        cursor.moveToBeginningOfLine()
    handleCursor cursor for cursor in editor.getCursors()
