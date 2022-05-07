/****************************************************
    文件：DeadArea.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using UnityEngine.SceneManagement;

public class DeadArea : MonoBehaviour 
{
    private void OnCollisionEnter2D(Collision2D col)
    {
        var scene = SceneManager.GetActiveScene();
        SceneManager.LoadScene(scene.name);
    }
}