/****************************************************
    文件：EditorCounterApp.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using UnityEditor;
using UnityEngine;

namespace CounterApp.Editor
{
    public class EditorCounterApp : EditorWindow 
    {
        [MenuItem("CounterApp/Open")]
        static void Open()
        {
            var window = GetWindow(typeof(EditorCounterApp));
            window.position = new Rect(100, 100, 400,400);
            window.titleContent = new GUIContent(nameof(EditorCounterApp));
            window.Show();
        }

        private void OnGUI()
        {
            if (GUILayout.Button("+"))
            {
                new AddCountCommand().Execute();
            }
            //GUILayout.Label(CounterModel.Count.Value.ToString());
            if (GUILayout.Button("-"))
            {
                new SubtractountCommand().Execute();
            }
        }
    }
}