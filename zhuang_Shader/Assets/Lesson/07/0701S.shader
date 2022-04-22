Shader "Unlit/0701S"
{
    Properties
    {
        _EvnUpCol ("上面颜色",color) = (1.0,1.0,1.0,1.0)
        _EvnSlideCol ("侧面颜色",color) = (0.5,0.5,0.5,1.0)
        _EvnDownCol ("下面颜色",color) = (0.0,0.0,0.0,1.0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            float3 _EvnUpCol;
            float3 _EvnSlideCol;
            float3 _EvnDownCol;

            struct VertexInput
            {
                float4 vertex : POSITION; //将模型顶点信息输入进来
                float4 normal : NORMAL;   //讲模型法线信息输入进来
            };

            struct VertexOutput
            {
                float4 posCS : SV_POSITION;//由模型顶点信息换算而来的顶点屏幕位置
                float3 nDirWS : TEXCOORD0;  //由模型顶点信息换算而来的世界空间法线信息
            };

            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;
            }

            float4 frag(VertexOutput i) : COLOR
            {
                //准备变量
                float3 nDir = i.nDirWS;
                float upMask = max(0.0,nDir.g);
                float downMask = max(0.0,-nDir.g);
                float slideMask = 1- upMask - downMask;
                float3 evnCol = upMask * _EvnUpCol + slideMask * _EvnSlideCol + downMask * _EvnDownCol;
                return float4(evnCol,1.0);
                //return float4(1.0,1.0,1.0,1.0);
            }
            
            ENDCG
        }
    }
}
