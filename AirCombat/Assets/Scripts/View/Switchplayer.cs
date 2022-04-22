/****************************************************
    文件：Switchplayer.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System.Collections.Generic;
using UnityEngine;
using YFramework;
using YFramework.UI;

public class Switchplayer : UIBase
{
    private int curId;
    private Dictionary<int, List<Sprite>> idSprsDict;
    private void LoadSprite()
    {
        idSprsDict = new Dictionary<int, List<Sprite>>();
        var sprs = LoaderManager.Instance.ResLoadAll<Sprite>(Paths.PicturePlayer);
        foreach (Sprite spr in sprs)
        {
            var idData = spr.name.Split("_");
            var playId = int.Parse(idData[0]);
            if (!idSprsDict.ContainsKey(playId))
            {
                idSprsDict[playId] = new List<Sprite>();
            }
            idSprsDict[playId].Add(spr);
        }
    }
    public override void Show()
    {
        base.Show();
        UiUtility.Get("Left").AddListener(()=>Switch(ref curId,-1));
        UiUtility.Get("Right").AddListener(()=>Switch(ref curId,1));
        LoadSprite();
        curId = DataManager.Instance.Get<int>(DataKeys.Level);
        UpdateSprite(curId);
    }

    private void Switch(ref int id, int direction)
    {
        UpdateID(ref id, direction);
        UpdateSprite(id);
    }

    private void UpdateID(ref int id, int direction)
    {
        int min = 0;
        int max = idSprsDict.Count;
        id += direction;
        //id = id < 0 ? 0 : id > 0 ? id = max - 1 : id;
        if (id < 0)
        {
            id = 0;
        }
        else if(id >= max)
        {
            id = max - 1;
        }
    }

    private void UpdateSprite(int id)
    {
        int level = DataManager.Instance.Get<int>(DataKeys.Level);
        UiUtility.Get("Icon").SetImage(idSprsDict[id][level]);
    }
}