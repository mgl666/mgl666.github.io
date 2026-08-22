---
title: "RainCast：高分辨率 72 小时短期降水预报模型"
title_zh: "RainCast：高分辨率 72 小时短期降水预报模型"
title_en: "RainCast: A High-Resolution 72-Hour Short-Term Precipitation Forecasting Model"
date: 2026-08-08 10:43:21 +0800
categories: [Portfolio]
sort_order: "007000.005"
pin: true
image:
  path: /assets/img/articles/raincast/RainCast_Architecture.png
  alt: "RainCast 模型架构"
---

<div class="content-zh" markdown="1">

我的论文 **RainCast: A High-Resolution 72-Hour Short-Term Precipitation Forecasting Model** 已发表于 **KDD 2026**。RainCast 面向中国区域，以 0.05° 空间分辨率生成未来 72 小时逐小时降水预报，同时支持确定性预测与概率集合预测。

> 论文链接：[ACM Digital Library](https://dl.acm.org/doi/10.1145/3770855.3818880)<br>
> 开源代码：[GitHub - NJUHML/RainCast](https://github.com/NJUHML/RainCast)

## 发表信息

| 项目 | 信息 |
| --- | --- |
| 论文题目 | RainCast: A High-Resolution 72-Hour Short-Term Precipitation Forecasting Model |
| 作者 | Guanlong Ma, Weiqi Chen, Yang Zhao, Huiling Yuan, Liang Sun |
| 会议 | The 32nd ACM SIGKDD Conference on Knowledge Discovery and Data Mining（KDD '26） |
| 论文集 | Proceedings of the 32nd ACM SIGKDD Conference on Knowledge Discovery and Data Mining V.2 |
| 页码 | 11621–11632 |
| ISBN | 979-8-4007-2259-2 |
| DOI | [10.1145/3770855.3818880](https://doi.org/10.1145/3770855.3818880) |
| 许可 | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) |

Guanlong Ma 与 Weiqi Chen 为共同第一作者；Huiling Yuan 与 Liang Sun 为通讯作者。

## 论文摘要

准确的短期降水预报需要预测未来 3 天内的降水演变，但极端降水样本稀缺、降水过程具有复杂的多尺度物理机制，使这一任务长期面临挑战。现有回归或分类式深度学习方法容易产生过度平滑的降水场，缺少明确的物理引导，对预报不确定性的刻画也较为有限；依赖雷达外推的临近预报方法则难以扩展到多日尺度。

为解决这些问题，我们提出 **RainCast**：一个面向中国区域、空间分辨率为 0.05°、预报时效最长为 72 小时的逐小时高分辨率降水预报框架。模型包含两个关键设计：

1. **物理引导的特征提取器**：借鉴连续方程诊断思想，从环流场中提取涡度、散度以及与垂直运动相关的信号，将气象物理先验融入数据驱动模型。
2. **多预测头设计**：通过回归头生成确定性预报，并通过集合头生成概率多成员预报，以减轻降水场的过度平滑并量化预报不确定性。

实验结果表明，RainCast 在多个基线上取得稳定提升。对于 24 小时累计降水达到 50 mm 的强降水事件，RainCast 相比 GFS 的 CSI 最高提升 **62.82%**；与 GEFS 相比，集合预报的 CRPS 平均降低 **19.35%**。可解释性分析还发现，**600 hPa 温度**是东亚降水预报中的重要信号，这可能与冻结层和融化层附近的水成物相态转换有关。

## 核心贡献

- 将短期降水预报时效扩展至 72 小时，并保持 0.05° 高空间分辨率与逐小时输出。
- 设计可学习的物理特征提取器，引入散度、涡度和垂直运动相关信息；在 0.1 mm/24 h 阈值上，物理模块使 CSI 提升 12.2%。
- 以回归、分类和集合预测头统一确定性预报与概率预报，其中集合头基于 Rectified Flow 生成多成员结果。
- 通过可解释性分析揭示 600 hPa 温度对东亚降水预报的重要作用，为数据驱动模型与气象机理之间建立联系。

</div>

<div class="content-en" markdown="1">

Our paper, **RainCast: A High-Resolution 72-Hour Short-Term Precipitation Forecasting Model**, has been published at **KDD 2026**. RainCast produces hourly precipitation forecasts over China for lead times up to 72 hours at 0.05° spatial resolution, supporting both deterministic and probabilistic ensemble prediction.

> Paper: [ACM Digital Library](https://dl.acm.org/doi/10.1145/3770855.3818880)<br>
> Code: [GitHub - NJUHML/RainCast](https://github.com/NJUHML/RainCast)

## Publication Information

| Item | Details |
| --- | --- |
| Title | RainCast: A High-Resolution 72-Hour Short-Term Precipitation Forecasting Model |
| Authors | Guanlong Ma, Weiqi Chen, Yang Zhao, Huiling Yuan, Liang Sun |
| Conference | The 32nd ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD '26) |
| Proceedings | Proceedings of the 32nd ACM SIGKDD Conference on Knowledge Discovery and Data Mining V.2 |
| Pages | 11621–11632 |
| ISBN | 979-8-4007-2259-2 |
| DOI | [10.1145/3770855.3818880](https://doi.org/10.1145/3770855.3818880) |
| License | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) |

Guanlong Ma and Weiqi Chen contributed equally. Huiling Yuan and Liang Sun are the corresponding authors.

## Abstract

Reliable short-term precipitation forecasting up to three days ahead remains difficult because extreme rainfall samples are scarce and precipitation is governed by nonlinear, multiscale physical processes. Existing regression- and classification-based deep learning methods often generate overly smooth precipitation fields, provide little explicit physical guidance, and have limited ability to represent forecast uncertainty. Radar-based nowcasting methods, meanwhile, are not designed for multi-day prediction.

We introduce **RainCast**, a high-resolution framework that generates hourly precipitation forecasts over China up to 72 hours ahead at 0.05° resolution. It contains two central components:

1. A **physics-guided feature extractor** inspired by continuity-equation diagnostics, which derives vorticity, divergence, and vertical-motion-related signals from atmospheric circulation fields.
2. A **multi-head prediction design** that combines deterministic regression forecasts with probabilistic multi-member ensemble forecasts, reducing spatial over-smoothing while representing uncertainty.

RainCast consistently outperforms the evaluated baselines. For heavy rainfall events reaching 50 mm in 24 hours, its CSI improvement over GFS is as high as **62.82%**. Its ensemble forecasts reduce CRPS by **19.35%** on average compared with GEFS. The interpretability study also identifies **600-hPa temperature** as an important signal for East Asian precipitation, potentially reflecting hydrometeor phase transitions near the freezing–melting layer.

## Main Contributions

- Extends high-resolution short-term precipitation prediction to 72 hours with hourly output at 0.05° resolution.
- Introduces a learnable physical feature extractor for divergence, vorticity, and vertical-motion-related information; the module improves CSI by 12.2% at the 0.1 mm/24 h threshold.
- Unifies deterministic and probabilistic forecasting through regression, classification, and ensemble heads, with the ensemble head using Rectified Flow to generate multiple members.
- Connects model interpretation with meteorological mechanisms by highlighting the role of 600-hPa temperature in East Asian precipitation forecasting.

</div>
