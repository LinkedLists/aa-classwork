class Array

    def my_uniq
        uniq_arr = []
        self.each do |ele|
            uniq_arr << ele unless uniq_arr.include?(ele)
        end
        uniq_arr
        # self.uniq
    end

    def two_sum
        arr = []
        i = 0
        while i < length
            j = 0
            while j < length
                arr << [i, j] if self[i] + self[j] == 0 && j > i 

                j += 1
            end
            i += 1
        end

        arr
        # hash = Hash.new(0)
        # arr = []
        # self.each_with_index do |n, i|
        #     if hash.has_key?(-n)
        #         arr << [hash[-n], i]
        #     else
        #         hash[n] = i
        #     end
        # end
        # arr 
    end
require "byebug"
    def my_transpose
        new_arr = Array.new(length) {Array.new(length, 0)}
        self.each_with_index do |row, idx1|
            row.each_with_index do |el, idx2|
                new_arr[idx1][idx2] = self[idx2][idx1]
            end 
        end
        new_arr
    end

    def stock_picker
        pair = []
        max = 0
        i = 0
        while i < length - 2
            j = i + 1
            while j < length - 1
                if max < self[j] - self[i]
                    max = self[j] - self[i]
                    pair = [i, j]
                end
                j += 1
            end
            i += 1
        end
        pair
    end

    def towers_hanoi
        
    end

end