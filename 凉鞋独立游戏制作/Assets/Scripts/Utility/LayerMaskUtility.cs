/****************************************************
    文件：LayerMaskUtility.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public class LayerMaskUtility : MonoBehaviour 
{
    public static bool Contains(LayerMask mask, int layer)
    {
        return (mask & 1 << layer) > 0;
    }
}