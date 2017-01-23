def two_sum(nums, target)
    presence_hash = {}
    nums.each_with_index do |value, index|
        partner = target - value
        presence_hash[value] = index  unless presence_hash[value]
        return [presence_hash[partner], index] if presence_hash[partner]
    end
    nil
end

arr = [1,3,5]
p two_sum arr, 4