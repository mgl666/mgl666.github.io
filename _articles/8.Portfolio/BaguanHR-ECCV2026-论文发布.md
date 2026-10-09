---
title: "BaguanHR：通过数据扩展突破高分辨率天气预报瓶颈"
title_zh: "BaguanHR：通过数据扩展突破高分辨率天气预报瓶颈"
title_en: "BaguanHR: Scaling Data for High-Resolution Weather Forecasting"
date: 2026-10-05 10:00:00 +0900
categories: [Portfolio]
sort_order: "008000.007"
pin: true
image:
  path: /assets/img/articles/baguanhr/BaguanHR_Architecture.png
  alt: "BaguanHR 模型架构"
  home_fit: contain
---

<div class="content-zh" markdown="1">

我参与的论文 **Pushing the Limits of High-Resolution Weather Forecasting Through Data Scaling** 已发表于 **ECCV 2026**。我们提出 **BaguanHR**，通过逐变量超分辨率扩充训练数据，支持全球 0.1° 高分辨率天气预报。

> 论文链接：[Springer Nature Link](https://link.springer.com/chapter/10.1007/978-3-032-37086-0_8)<br>
> 预印本：[arXiv:2608.14652](https://arxiv.org/abs/2608.14652)

## 发表信息

| 项目 | 信息 |
| --- | --- |
| 论文题目 | Pushing the Limits of High-Resolution Weather Forecasting Through Data Scaling |
| 作者 | Yang Zhao, Peisong Niu, Tian Zhou, Ziqing Ma, Guanlong Ma, Rong Jin, Huiling Yuan, Liang Sun |
| 会议 | 19th European Conference on Computer Vision（ECCV 2026） |
| 论文集 | Computer Vision – ECCV 2026, Proceedings, Part LIX |
| 丛书 | Lecture Notes in Computer Science（LNCS），第 17059 卷 |
| 页码 | 135–152 |
| 出版社 | Springer, Cham |
| 正式上线日期 | 2026 年 10 月 5 日 |
| 电子版 ISBN | 978-3-032-37086-0 |

Yang Zhao、Peisong Niu 与 Tian Zhou 为共同第一作者；Huiling Yuan 与 Liang Sun 为通讯作者。

## 论文摘要

全球 0.1° 天气预报面临高分辨率训练数据不足的问题，而长期 ERA5 再分析资料主要提供 0.25° 数据。BaguanHR 使用逐变量超分辨率重建，将这些历史资料转为 0.1° 合成数据，再结合真实高分辨率资料训练预报模型。

实验中，BaguanHR 在 72 小时内超过 **85% 的预报时效**上优于所评估的机器学习方法及 IFS-HRES。数据规模扩展带来幂律式性能改善：论文报告 72 小时和 120 小时预报的 RMSE 分别降低 **4.6%** 和 **4.9%**。

以上内容根据[正式发表版本摘要](https://link.springer.com/chapter/10.1007/978-3-032-37086-0_8)整理。

## 核心贡献

- **扩充高分辨率数据**：以逐变量超分辨率利用长期低分辨率再分析资料。
- **验证训练策略**：实验与理论分析支持合成数据和真实数据结合的方案。
- **揭示数据规模效应**：量化增加训练数据对不同预报时效的收益。

方法细节见[论文全文](https://arxiv.org/html/2608.14652v1)。

</div>

<div class="content-en" markdown="1">

Our paper, **Pushing the Limits of High-Resolution Weather Forecasting Through Data Scaling**, has been published at **ECCV 2026**. **BaguanHR** uses variable-wise super-resolution to expand training data for global 0.1° weather forecasting.

> Paper: [Springer Nature Link](https://link.springer.com/chapter/10.1007/978-3-032-37086-0_8)<br>
> Preprint: [arXiv:2608.14652](https://arxiv.org/abs/2608.14652)

## Publication Information

| Item | Details |
| --- | --- |
| Title | Pushing the Limits of High-Resolution Weather Forecasting Through Data Scaling |
| Authors | Yang Zhao, Peisong Niu, Tian Zhou, Ziqing Ma, Guanlong Ma, Rong Jin, Huiling Yuan, Liang Sun |
| Conference | 19th European Conference on Computer Vision (ECCV 2026) |
| Proceedings | Computer Vision – ECCV 2026, Proceedings, Part LIX |
| Series | Lecture Notes in Computer Science (LNCS), volume 17059 |
| Pages | 135–152 |
| Publisher | Springer, Cham |
| First online | October 5, 2026 |
| Online ISBN | 978-3-032-37086-0 |

Yang Zhao, Peisong Niu, and Tian Zhou contributed equally. Huiling Yuan and Liang Sun are the corresponding authors.

## Abstract

High-resolution training data is scarce. BaguanHR reconstructs historical 0.25° ERA5 fields at 0.1° and combines synthetic and real data to train a forecasting model.

It outperforms evaluated ML baselines and IFS-HRES at over **85% of lead times within 72 hours**. Data scaling follows a power-law trend, with reported RMSE reductions of **4.6%** at 72 hours and **4.9%** at 120 hours.

This summary is based on the [published abstract](https://link.springer.com/chapter/10.1007/978-3-032-37086-0_8).

## Main Contributions

- **Data expansion:** variable-wise super-resolution makes historical reanalysis useful for high-resolution training.
- **Training strategy:** experiments and theory support combining synthetic and real data.
- **Scaling analysis:** quantifies benefits across forecast horizons.

See the [full paper](https://arxiv.org/html/2608.14652v1) for methodology details.

</div>
