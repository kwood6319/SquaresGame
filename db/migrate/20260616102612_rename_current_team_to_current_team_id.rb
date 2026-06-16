class RenameCurrentTeamToCurrentTeamId < ActiveRecord::Migration[8.1]
  def change
    rename_column :games, :current_team, :current_team_id
  end
end
