class DbObject
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
        @db = db_name.to_s
    end
end