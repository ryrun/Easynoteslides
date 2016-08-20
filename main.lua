function toimp_pitchnote(dir)
  local idx = math.max(renoise.song().selected_note_column_index,renoise.song().selected_effect_column_index)
  local line = renoise.song().selected_line
  local note = line.note_columns[idx]
  local fx = line.effect_columns[idx]
  
  if 
    note 
    and fx 
    and note.note_value < 120
    and (fx.number_value == 0 or fx.number_value == 30 or fx.number_value == 13)
    then
      -- nach oben
      if dir == 1 then
      
        if fx.number_value == 0 then
          fx.number_value = 13
          fx.amount_value = 0x10
          note.note_value = note.note_value + 1
        elseif fx.number_value == 13 and fx.amount_value<0xff then
          fx.amount_value = fx.amount_value + 0x10
          note.note_value = note.note_value + 1
        elseif fx.number_value == 30 and fx.amount_value<0x11 then
          fx.amount_value = 0
          fx.number_value = 0
          note.note_value = note.note_value + 1        
        elseif fx.number_value == 30 then
          fx.amount_value = fx.amount_value - 0x10
          note.note_value = note.note_value + 1
        end
        
      --nach unten
      elseif dir == 0 then
  
        if fx.number_value == 0 then
          fx.number_value = 30
          fx.amount_value = 0x10
          note.note_value = note.note_value - 1
        elseif fx.number_value == 30 and fx.amount_value<0xff then
          fx.amount_value = fx.amount_value + 0x10
          note.note_value = note.note_value - 1
        elseif fx.number_value == 13 and fx.amount_value<0x11 then
          fx.amount_value = 0
          fx.number_value = 0
          note.note_value = note.note_value - 1   
        elseif fx.number_value == 13 then
          fx.amount_value = fx.amount_value - 0x10
          note.note_value = note.note_value - 1        
        end
            
      end
      
  end
end

renoise.tool():add_keybinding {
   name = "Global:Easynoteslides:Pitch note up ...",
   invoke = function() toimp_pitchnote(1) end
                              }

renoise.tool():add_keybinding {
   name = "Global:Easynoteslides:Pitch note down ...",
   invoke = function() toimp_pitchnote(0) end
                              }

