class DbObject

    def self.db_name(name)
        @db = name
    end

    def self.table_name(name)
        @table_name = name
    end

    def self.columns(column)
        if @columns
            @columns << column
        else
            @columns = [column]
        end
    end

    def self.join(other_table)
        @join = "JOIN #{other_table[other_table.keys[0]]} ON #{}"
    end
    
end