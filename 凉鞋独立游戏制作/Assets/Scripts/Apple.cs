/****************************************************
    文件：Apple.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using UnityEngine.Events;

public class Apple : MonoBehaviour
{
    public UnityEvent OnGet;
    private void OnTriggerEnter2D(Collider2D col)
    {
        OnGet?.Invoke();
        Destroy(gameObject);
    }
}