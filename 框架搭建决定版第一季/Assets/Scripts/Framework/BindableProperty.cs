/****************************************************
    文件：BindableProprety.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/


using System;

public class BindableProperty<T> where T : IEquatable<T>
{
    public Action<T> onValueChanged;

    private T _value = default(T);

    public T Value
    {
        get
        {
            return _value;
        }
        set
        {
            if (!_value.Equals(value))
            {
                _value = value;
                onValueChanged?.Invoke(value);
            }
        }
    }
}