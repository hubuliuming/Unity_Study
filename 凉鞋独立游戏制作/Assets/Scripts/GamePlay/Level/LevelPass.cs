/****************************************************
    文件：LevelPass.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using YFramework;

public class LevelPass : YMonoBehaviour
{
    public Text levelPassText;
    public UnityEvent OnLevelPass;
    private void OnTriggerEnter2D(Collider2D col)
    {
        levelPassText.gameObject.SetActive(true);   
        OnLevelPass?.Invoke();
        Delay(2, () =>
        {
            var scene = SceneManager.GetActiveScene();
            SceneManager.LoadScene(scene.name);
        });
    }
}