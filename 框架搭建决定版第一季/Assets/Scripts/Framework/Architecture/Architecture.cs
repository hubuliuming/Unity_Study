/****************************************************
    文件：Architecture.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/


public abstract class Architecture<T> where  T : Architecture<T>, new()
{
    private static T _architecture;

    static void MakeSureContainer()
    {
        if (_architecture == null)
        {
            _architecture = new T();
            _architecture.Init();
        }
    }

    protected abstract void Init();

    private IOCContainer _container = new IOCContainer();
    public static T Get<T>() where T : class
    {
        MakeSureContainer();
        return _architecture._container.Get<T>();
    }
    
    public void Register<T>(T instance)
    {
        MakeSureContainer();
        _architecture._container.Register<T>(instance);
    }

}