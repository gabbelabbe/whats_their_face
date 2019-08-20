class DbObject

    def self.join(other_table)   
        @join = "JOIN #{other_table[other_table.keys[0]]} ON #{@table_name}.#{@columns[-1]} = #{other_table[other_table.keys[0]]}.id"
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

    def self.db_name(db_name)
        @db = SQLite3::Database.new db_name.to_s
    end

    def self.all(&block)
        if block_given?
            if block[:join]
                self.join(block[:join])
            else
                @join = ""
            end
        end
        results = @db.execute("SELECT * FROM #{@table_name}")
    end
end