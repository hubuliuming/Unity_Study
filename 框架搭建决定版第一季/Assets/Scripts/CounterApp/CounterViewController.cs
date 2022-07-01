/****************************************************
    文件：CounterViewController.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using UnityEngine.UI;

namespace CounterApp
{
    public class CounterViewController : MonoBehaviour
    {
        private CounterModel _counterModel = new CounterModel();
        private void Start()
        {
            _counterModel = CounterApp.Get<CounterModel>();
            _counterModel.Count.onValueChanged += OnCountChanged;
            OnCountChanged(_counterModel.Count.Value);
            transform.Find("BtnAdd").GetComponent<Button>().onClick.AddListener(()=>
            {
                new AddCountCommand().Execute();
            });
            transform.Find("BtnSubtract").GetComponent<Button>().onClick.AddListener(()=>
            {
                new SubtractountCommand().Execute();
            });
            
        }

        private void OnDestroy()
        {
            _counterModel.Count.onValueChanged -= OnCountChanged;
            _counterModel = null;
        }

        private void OnCountChanged(int newCount)
        {
            transform.Find("Show").GetComponentInChildren<Text>().text = newCount.ToString();
        }
        
    }

    public class CounterModel
    {
        private  int _count;

        public  BindableProperty<int> Count = new BindableProperty<int>()
        {
            Value = 0,
        };
    }

 
}