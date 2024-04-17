@storage_var
func counter() -> (value: felt):
end

@constructor
func constructor(initial_value: felt):
    # 初始化计数器值
    counter.write(initial_value)
    return ()
end

@external
func increment(amount: felt):
    # 增加计数器值
    let (current_value) = counter.read()
    counter.write(current_value + amount)
    return ()
end

@external
func decrement(amount: felt):
    # 减少计数器值
    let (current_value) = counter.read()
    assert current_value >= amount, "Counter underflow"
    counter.write(current_value - amount)
    return ()
end

@view
func get_count() -> (value: felt):
    # 返回当前计数器值
    let (value) = counter.read()
    return (value)
end
