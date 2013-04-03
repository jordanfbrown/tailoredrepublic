class Array
  def even_groups_of(num_groups)
    groups = []
    each_with_index { |item, index| (groups[index % num_groups] ||= []) << item }
    groups
  end
end



