# Week 2 - Evolutionary Computing 🚀

## 📌 Overview  
This folder contains **lectures, exercises, MATLAB implementations, and research references** on **Real-Coded Genetic Algorithms (RGA), Particle Swarm Optimization (PSO), and Differential Evolution (DE)**. The focus is on understanding and implementing these optimization techniques using MATLAB for real-world applications.

---

## 📂 Folder Structure  
```
02_Week 2 Evolutionary Computing  
│── 01_Lecture 04 - Real-Coded Genetic Algorithm (RGA)  
│── 02_Lecture 05 - Particle Swarm Optimization (PSO)  
│── 03_Lecture 06 - Differential Evolution (DE)  
│── 04_EXERCISES WEEK 2  
│── README.md  
```
---

## 📚 **Lectures & Notes**  

### 📂 **01_Lecture 04 - Real-Coded Genetic Algorithm (RGA)**  
- **RGA Operators & Simulations.pdf** - Explains the functioning of RGA.
- **Implementation of BGA and RGA.pdf** - Compares binary and real-coded GA.

#### 🔬 **MATLAB Implementation - RGA**  
- **Mutation & Selection Operators:**
  - `Mutate.m` - Implements mutation for RGA.
  - `RouletteWheelSelection.m` - Roulette wheel selection algorithm.
  - `StochasticUniversalSamplingSelection.m` - Alternative selection method.
- **Crossover Operators:**
  - `applyRealDoublePointCrossover.m` - Implements double-point crossover.
  - `applyRealLinearCrossover.m` - Applies linear crossover.
- **Execution & Testing:**
  - `RunGA.m` - Main script to run Real-Coded GA.
  - `SortPopulation.m` - Sorting based on fitness.
  - `Sphere.m` - Test function for optimization.

📌 **Key Concepts:**  
- **Comparison between Binary and Real-Coded GA.**  
- **Advanced Selection & Crossover Strategies in RGA.**  
- **Implementation of Real-Coded GA in MATLAB.**  

---

### 📂 **02_Lecture 05 - Particle Swarm Optimization (PSO)**  
- **Particle Swarm Optimization (PSO).pdf** - Introduction to PSO.
- **Implementation of PSO Algorithms.pdf** - Detailed implementation of PSO.

#### 🔬 **MATLAB Implementation - PSO**  
- **PSO Algorithm Implementation:**
  - `PSO.m` - Main PSO algorithm implementation.
  - `pso1.m, pso2.m` - Variants of PSO.
- **Benchmark Functions & Testing:**
  - `Sphere.m` - Test function for PSO.
  - `FitnessFunction.m` - Evaluates swarm performance.
- **Visualization & GUI:**
  - `PSO_Contour.zip` - MATLAB files for visualizing PSO.
  - `pso_customGUI.fig` - GUI for PSO testing.
  - `PSO_RosenbrockGraph.fig` - Visualization of Rosenbrock function optimization.

📌 **Key Concepts:**  
- **Particle Swarm Behavior and Parameter Tuning.**  
- **Optimization using PSO in MATLAB.**  
- **Comparison with Genetic Algorithms.**  

---

### 📂 **03_Lecture 06 - Differential Evolution (DE)**  
- **Differential Evolution (DE).pdf** - Overview of DE technique.
- **Implementation of DE.pdf** - Step-by-step explanation of DE.

#### 🔬 **MATLAB Implementation - DE**  
- **DE Algorithm Implementation:**
  - `DE.m` - Main implementation for DE.
  - `RunDE.m` - Runs DE for function optimization.
- **Testing & Visualization:**
  - `RosenbrockFunction.m` - Benchmark function.
  - `ContourPlots.m` - Visualizes the optimization process.

📌 **Key Concepts:**  
- **Mutation, Crossover, and Selection in DE.**  
- **Comparing DE, PSO, and GA for Optimization.**  
- **Implementation of Differential Evolution in MATLAB.**  

---

## 📝 **Weekly Exercises & Reports**  
📂 **04_EXERCISES WEEK 2**  

- **EC - Weekly Exercises 2.docx** - Weekly problem set on GA, PSO, and DE.  
- **REPORT_WEEK_2_P2849288.pdf** - Analysis and solution reports.  
- **MATLAB Scripts for Optimization Exercises.**  
- **Visualization Results for Function Optimization.**  

📌 **Key Exercises:**  
- **Implementing Genetic Algorithms in MATLAB.**  
- **Optimizing Functions Using PSO.**  
- **Applying Differential Evolution to Benchmark Problems.**  

---

## 📢 **Acknowledgment**  
This material is part of the **MSc Artificial Intelligence program at De Montfort University (DMU).**  
Special thanks to **faculty, peers, and researchers** for their contributions.  

🚀 **Optimizing Solutions with Evolutionary Computing!**  
